#!/bin/sh
# GRUB config generator for Fedora
LIGHT_GREEN='\033[1;32m'
LIGHT_CYAN='\033[1;36m'
YELLOW='\033[1;33m'
DEFAULT='\033[0m'
echo -e "${LIGHT_GREEN}Updating GRUB configuration...${DEFAULT}"
echo -e "${YELLOW}Updating ${LIGHT_CYAN}/etc/grub2.cfg...${DEFAULT}"
sudo grub2-mkconfig -o /etc/grub2.cfg
echo -e "${YELLOW}Updating ${LIGHT_CYAN}/etc/grub2-efi.cfg...${DEFAULT}"
sudo grub2-mkconfig -o /etc/grub2-efi.cfg
echo -e "${YELLOW}Updating ${LIGHT_CYAN}/boot/grub2/grub.cfg...${DEFAULT}"
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
echo -e "${LIGHT_GREEN}GRUB configuration updated.${DEFAULT}"

