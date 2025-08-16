# Hvordan få systemd til å ignorere closelid-events

Dette funka hvertfall med EndeavourOS på Heine.

Som beskrevet her: https://askubuntu.com/questions/1506546/how-to-change-lid-close-behavior-to-do-nothing

Rediger `/etc/systemd/logind.conf`:

```
HandleLidSwitch=ignore
HandleListSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
LidSwitchIgnoreInhibited=no
```

Endringene kan reloades med følgende kommando (https://github.com/systemd/systemd/issues/18484):

```
systemctl reload systemd-logind.service
```
