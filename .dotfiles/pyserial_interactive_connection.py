#!/usr/sbin/python3

# usage: pyserial_interactive_connection.py [-h] [--timeout TIMEOUT] [--history-file HISTORY_FILE] serial_port baudrate [command ...]

# positional arguments:
#   serial_port           Serial communication port to use
#   baudrate              Baudrate for serial communication
#   command               Send command, wait listen for response and exit (default: None)

# options:
#   -h, --help            show this help message and exit
#   --timeout TIMEOUT, -t TIMEOUT
#                         Timeout in seconds used for each serial read (default: 0.1)
#   --history-file HISTORY_FILE, -f HISTORY_FILE
#                         Path to file for reading and storing history of previously sent commands (default: None)

import serial
import serial.tools.list_ports
import sys
import time
import threading
import argparse

from prompt_toolkit import PromptSession
from prompt_toolkit.key_binding import KeyBindings
from prompt_toolkit.key_binding.bindings.named_commands import end_of_line
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.history import FileHistory
from prompt_toolkit.patch_stdout import patch_stdout


if __name__ == "__main__":
    class ArgumentParserCustom(argparse.ArgumentParser):
        def error(self, message):
            sys.stderr.write(f"error: {message}\n")
            self.print_help()
            sys.exit(2)

    argument_parser = ArgumentParserCustom(
        epilog="Available serial ports are: "+", ".join([str(port) for port in  serial.tools.list_ports.comports()]),
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    argument_parser.add_argument("--timeout", "-t", type=float, default=.1, help="Timeout in seconds used for each serial read")
    argument_parser.add_argument("--history-file", "-f", type=str, default=None, help="Path to file for reading and storing history of previously sent commands")
    argument_parser.add_argument("serial_port", type=str, help="Serial communication port to use")
    argument_parser.add_argument("baudrate", type=int, help="Baudrate for serial communication")
    argument_parser.add_argument("command", type=str, nargs="*", help="Send command, listen for response and exit")
    args = argument_parser.parse_args()

    key_bindings = KeyBindings()
    @key_bindings.add("end")
    def _(event):
        """
        Insert suggestion when user presses end.
        """
        suggestion = event.current_buffer.suggestion
        if suggestion:
            event.current_buffer.insert_text(suggestion.text)
        end_of_line(event)

    history_kwargs = {}
    if args.history_file is not None:
        history_kwargs["history"] = FileHistory(args.history_file)

    prompt_session = PromptSession(
        key_bindings=key_bindings,
        **history_kwargs,
        auto_suggest=AutoSuggestFromHistory(),
    )

    serial_port = args.serial_port

    try:
        serial_connection = serial.Serial(port=serial_port, baudrate=args.baudrate, timeout=args.timeout)
    except Exception as exception:
        print(exception)
        print("Something went wrong. Did you enter the correct serial port?")
        print("Available ports are:")
        for port in serial.tools.list_ports.comports():
            print(f"    {port}")
        print("If you are on Linux you might have to get permission to read/write to the device with")
        print(f"    sudo chmod a+rw {serial_port}")
        sys.exit(1)

    time.sleep(0.1)

    exit_event = threading.Event()

    def read_output_thread():
        global serial_connection, exit_event, prompt_session

        while not exit_event.is_set():
            print(serial_connection.read(size=1).decode("ascii"), end="")

    if len(args.command) > 0:
        command = " ".join(args.command)
        command = (command + "\n").encode(encoding="ascii")
        serial_connection.write(command)
        while True:
            answer = serial_connection.read(size=1)
            if answer == b"":
                break
            print(answer.decode("ascii"), end="")
        sys.exit()

    threading.Thread(target=read_output_thread).start()

    print(f"Successfully connected to ucboard on {serial_port}")
    print("Type the command you want to send below and press ENTER to send it")
    print("Press Ctrl+C to exit")

    try:
        while True:
            with patch_stdout():
                command = prompt_session.prompt("> ")
            command = (command + "\n").encode(encoding="ascii")
            serial_connection.write(command)
    except (KeyboardInterrupt, EOFError):
        # Exit on Ctrl+C and Ctrl+D
        exit_event.set()
