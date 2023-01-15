"""
Configuration example for ``ptpython``.
Copy this file to $XDG_CONFIG_HOME/ptpython/config.py
On Linux, this is: ~/.config/ptpython/config.py
"""
from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.key_processor import KeyPress
from prompt_toolkit.keys import Keys
from prompt_toolkit.styles import Style

from ptpython.layout import CompletionVisualisation

__all__ = ["configure"]


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.
    :param repl: `PythonRepl` instance.
    """

    repl.use_code_colorscheme("monokai")
    repl.insert_blank_line_after_output = False
    repl.confirm_exit = False
    # repl.enable_auto_suggest = True
    repl.highlight_matching_parenthesis = True
