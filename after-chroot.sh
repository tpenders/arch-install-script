ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime &&
hwclock --systohc &&
pacman -S nano sudo grub efibootmgr dosfstools os-prober mtools &&
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen &&
localectl set-locale LANG=en_US.UTF-8 &&
locale-gen &&
echo "linux" > /etc/hostname &&                                                                           
echo "127.0.0.1 localhost" > /etc/hosts &&                                                                
echo "::1 localhost" >> /etc/hosts
echo "Enter password for root user" &&
passwd &&                                                                                                 
useradd -m arch &&
echo "Enter password for non-root user" &&
passwd arch &&
usermod -aG wheel,audio,video,optical,storage arch &&
mkdir /boot/EFI &&                                                                                        
mount /dev/mmcblk0p1 /boot/EFI &&
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck &&
grub-mkconfig -o /boot/grub/grub.cfg &&
pacman -S base-devel networkmanager git xorg xorg-xinit &&
systemctl enable NetworkManager &&
echo "root ALL=(ALL) ALL" > /etc/sudoers &&
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers &&
echo "@includedir /etc/sudoers.d" >> /etc/sudoers &&
echo "Done"
