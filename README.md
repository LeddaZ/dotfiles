# dotfiles
Various configurations I keep across Linux distros

## Description
- `.local/share/fonts`: Additional fonts
- `bin/apktool`: Wrapper script for `apktool`
- `bin/disable-prochot.sh`: Script to disable BD PROCHOT (the value is adapted to my laptop; read [here](https://github.com/DivyanshuVerma/throttlestop-linux) for more info); also goes to `/usr/lib/systemd/system-sleep`. Needs the `msr` kernel module.
- `bin/pd.sh`: Script to upload files to Pixeldrain (`pd <link1> <link2>`)
- `.bashrc`: Bash rc file
- `.profile`: Profile file
- `.zshrc`: Zsh rc file
- `disable-prochot.service`: systemd unit to run the BD PROCHOT disable script; copy to `/etc/systemd/system` and run `sudo systemctl enable disable-prochot`, then reboot
- `docker-compose.yml`: Docker Compose configuration for my containers
- `mute.conf`: Config file for the `snd-hda-intel` kernel module to fix the mute LED on HP laptops, copy to `/etc/modprobe.d` and reboot
- `zed-settings.json`: My Zed settings
