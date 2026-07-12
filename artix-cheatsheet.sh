# ==========================
# ARTIX LINUX INSTALL CHEATSHEET
# dinit + iwd + limine + NVMe
# ==========================

# Keyboard layout (example: US)
loadkeys us

# --------------------------
# Partition disk
# --------------------------

cfdisk /dev/nvme0n1

# Create GPT:
#
# /dev/nvme0n1p1  1G      EFI System Partition
# /dev/nvme0n1p2  7.5G    Linux swap
# /dev/nvme0n1p3  rest    Linux filesystem

# --------------------------
# Format partitions
# --------------------------

# EFI partition
mkfs.fat -F32 /dev/nvme0n1p1
fatlabel /dev/nvme0n1p1 ESP

# Root filesystem
mkfs.ext4 -L ROOT /dev/nvme0n1p3

# Swap
mkswap -L SWAP /dev/nvme0n1p2

# --------------------------
# Mount filesystems
# --------------------------

swapon /dev/disk/by-label/SWAP

mount /dev/disk/by-label/ROOT /mnt

mkdir -p /mnt/boot/efi

mount /dev/disk/by-label/ESP /mnt/boot/efi

# --------------------------
# Connect network
# --------------------------

# Start iwd
iwctl

# Check network
ping artixlinux.org


# --------------------------
# Sync clock
# --------------------------

# Artix 2026 ISOs use chrony
dinitctl start chrony

# --------------------------
# Install base system
# --------------------------

basestrap /mnt base base-devel linux-zen linux-firmware dinit elogind-dinit

# --------------------------
# Generate fstab
# --------------------------

fstabgen -U /mnt >> /mnt/etc/fstab

# Check fstab
nano /mnt/etc/fstab

# --------------------------
# Chroot
# --------------------------

artix-chroot /mnt

# ==========================
# SYSTEM CONFIGURATION
# ==========================

# --------------------------
# Timezone
# --------------------------

ln -sf /usr/share/zoneinfo/Region/City /etc/localtime

hwclock --systohc

# --------------------------
# Locale
# --------------------------

pacman -S nano

nano /etc/locale.gen

# Uncomment:
# en_US.UTF-8 UTF-8

locale-gen

nano /etc/locale.conf

# Example:
LANG=en_US.UTF-8

# --------------------------
# Hostname
# --------------------------

echo myhostname > /etc/hostname

nano /etc/hosts

# Add:
#
# 127.0.0.1 localhost
# ::1       localhost
# 127.0.1.1 myhostname.localdomain myhostname

# --------------------------
# Root password
# --------------------------

passwd

# --------------------------
# Create user
# --------------------------

useradd -m -G wheel -s /bin/bash username

passwd username

# Enable sudo
pacman -S sudo

EDITOR=nano visudo

# Uncomment:
# %wheel ALL=(ALL:ALL) ALL

# ==========================
# NETWORK (iwd)
# ==========================

pacman -S iwd dhcpcd

# Enable iwd with dinit

ln -s /etc/dinit.d/iwd /etc/dinit.d/boot.d/

ln -s /etc/dinit.d/dhcpcd /etc/dinit.d/boot.d/

# Enable wireless networking after boot
# iwd will manage WiFi
# dhcpcd handles DHCP

# ==========================
# LIMINE BOOTLOADER
# ==========================

pacman -S limine efibootmgr

# Install Limine to EFI partition

limine-install \
--path=/boot/efi \
--removable

# Create limine config

mkdir -p /boot/limine

nano /boot/limine/limine.conf

# Example config:
#
# timeout: 5
#
# /Artix Linux
#     protocol: linux
#     path: boot:///vmlinuz-linux
#     cmdline: root=UUID=YOUR_ROOT_UUID rw
#     module_path: boot:///initramfs-linux.img

# Get root UUID:
blkid /dev/nvme0n1p3

# Install CPU microcode

# Intel:
pacman -S intel-ucode

# AMD:
pacman -S amd-ucode

# ==========================
# FINISH
# ==========================

exit

umount -R /mnt

reboot
