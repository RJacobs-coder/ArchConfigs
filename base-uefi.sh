#!/bin/bash

#Use this script just after you enter mount via "arch-chroot /mnt"

ln -sf /usr/share/zoneinfo/Australia/Perth /etc/localtime
hwclock --systohc
sed -i '152s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_AU.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "diskArch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 diskArch.localdomain diskArch" >> /etc/hosts
echo root:password | rootytooty123

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm


# Main Pacman download - base, base-devel, linux, linux-firmware, nano, btrfs-progs are installed earlier
pacman -S --nonconfirm alacritty alsa-utils conky cups dialog dosfstools efitbootmgr firefox flameshot git grub grub-btrfs libreoffice-still lightdm lightdm-gtk-greeter linux-headers mtools network-manager-applet networkmanager os-prober pulseaudio pulsemixer reflector unzip vim xdg-user-dirs xfce4 xfce4-pulseaudio-plugin xorg xorg-xinit zip adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts fcitx5-chinese-addons fcitx5-gtk fcitx5-mozc libreoffice-still-zh-cn ntfs-3g 
# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings



grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable sshd
systemctl enable reflector.time
systemctl enable lightdm

useradd -mG wheel,disk,audio,video admin
echo admin:password | rootytooty123

echo "admin ALL=(ALL) ALL" >> /etc/sudoers.d/admin

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S --nonconfirm timeshift timeshift-autosnap google-chrome



printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




