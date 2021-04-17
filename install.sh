timedatectl set-ntp true &&
parted /dev/mmcblk0 mklabel gpt mkpart "EFI system partition" fat32 1MiB 550MiB  &&
parted /dev/mmcblk0 mkpart "Linux swap partition" linux-swap 550MiB 2598MiB &&
parted /dev/mmcblk0 mkpart "Linux system partition" ext4 2598MiB 100% &&
fdisk -l &&
mkfs.fat -F32 /dev/mmcblk0p1 &&
mkswap /dev/mmcblk0p2 &&
swapon /dev/mmcblk0p2 &&
mkfs.ext4 /dev/mmcblk0p3
mount /dev/mmcblk0p3 /mnt &&
pacstrap /mnt base base-devel linux linux-firmware &&
genfstab -U /mnt >> /mnt/etc/fstab &&
echo "run arch-chroot /mnt and then start the second script"
