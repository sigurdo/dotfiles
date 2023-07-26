# WSL connect USB

USB devices can be connected to WSL2 ([https://learn.microsoft.com/en-us/windows/wsl/connect-usb](https://learn.microsoft.com/en-us/windows/wsl/connect-usb)). You need a Windows service called usbip. Then you can list windows devices with

```
cmd.exe /c "usbipd wsl list"
```

When you know which device you can connect, you can connect it with

```
wudo cmd.exe /c "usbipd wsl attach --hardware-id xxxx:yyyy --auto-attach"
```

To get read/write access to the device, you must add a udev-rule `/lib/udev/rules.d/99-usb-device-name.rules`:

```
ATTRS{idVendor}=="xxxx", MODE="666"
```

or you can have a general rule `/lib/udev/rules.d/99-usb-device.rules` granting read/write access to all USB devices:

```
SUBSYSTEM=="usb", MODE="666"
```
