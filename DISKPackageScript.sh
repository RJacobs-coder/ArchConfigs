#!/bin/bash

pacman -S --noconfirm alacritty alsa-utils conky cups dialog firefox flameshot libreoffice-still lightdm lightdm-gtk-greeter mtools network-manager-applet os-prober pulseaudio pulsemixer unzip zip gvim xdg-user-dirs xfce4 xfce4-pulseaudio-plugin xorg xorg-xinit zip adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts fcitx5-chinese-addons fcitx5-chewing fcitx5-gtk fcitx5-mozc libreoffice-still-zh-cn ntfs-3g 
# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

systemctl enable reflector.time
systemctl enable lightdm

#su -admin
#git clone https://aur.archlinux.org/paru.git
#cd paru
#makepkg -si

#paru -S --nonconfirm timeshift timeshift-autosnap google-chrome
