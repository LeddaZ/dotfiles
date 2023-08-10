# dotfiles
Various configurations I keep across Linux distros

## Description
- `.config/alacritty/alacritty.yml`: Alacritty configuration file
- `.local/share/fonts`: Additional fonts
- `bin/disable-prochot.sh`: Script to disable BD PROCHOT (the value is adapted to my laptop; read [here](https://github.com/DivyanshuVerma/throttlestop-linux) for more info); also goes to `/usr/lib/systemd/system-sleep`. Needs the `msr` kernel module.
- `bin/pd.sh`: Script to upload files to Pixeldrain (`pd <link1> <link2>`)
- `bin/shfmt`: Bash script formatter
- `bin/unzip.sh`: `unzip` wrapper to disable zipbomb detection
- `bin/update-grub.sh`: Script to properly update GRUB configuration on Fedora
- `.bashrc`: Bash rc file
- `.profile`: Profile file
- `.zshrc`: Zsh rc file
- `disable-prochot.service`: systemd unit to run the BD PROCHOT disable script; copy to `/etc/systemd/system` and run `sudo systemctl enable disable-prochot`, then reboot
- `mute.conf`: Config file for the `snd-hda-intel` kernel module to fix the mute LED on HP laptops, copy to `/etc/modprobe.d` and reboot
- `sign.txt`: Commands to sign an Android build
- `totoro.txt`: ASCII art for `neofetch`
