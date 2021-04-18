timedatectl set-ntp true &&
parted /dev/mmcblk0 mklabel gpt &&
mkpart /dev/mmcblk0 fat32 1MiB 550MiB  &&
parted /dev/mmcblk0 linux-swap 550MiB 2598MiB &&
parted /dev/mmcblk0 ext4 2598MiB 100% &&
mkfs.fat -F32 /dev/mmcblk0p1 &&
mkswap /dev/mmcblk0p2 &&
swapon /dev/mmcblk0p2 &&
mkfs.ext4 /dev/mmcblk0p3
mount /dev/mmcblk0p3 /mnt &&
pacstrap /mnt base base-devel linux linux-firmware &&
genfstab -U /mnt >> /mnt/etc/fstab &&
echo "run arch-chroot /mnt and then start the second script"
