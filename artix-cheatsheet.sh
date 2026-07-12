
########################
# Keyboard
########################

loadkeys us

########################
# Partition disk
########################

cfdisk /dev/sda

# Example:
# /dev/sda1 512M EFI System
# /dev/sda2 Root
# /dev/sda3 Home (optional)
# /dev/sda4 Swap (optional)

########################
# Format
########################

mkfs.fat -F32 /dev/sda1
fatlabel /dev/sda1 ESP

mkfs.ext4 -L ROOT /dev/sda2
mkfs.ext4 -L HOME /dev/sda3      # optional

mkswap -L SWAP /dev/sda4         # optional

########################
# Mount
########################

swapon /dev/disk/by-label/SWAP   # optional

mount /dev/disk/by-label/ROOT /mnt

mkdir -p /mnt/{boot,home}
mount /dev/disk/by-label/HOME /mnt/home    # optional

mkdir -p /mnt/boot/efi
mount /dev/disk/by-label/ESP /mnt/boot/efi

########################
# Connect WiFi (iwd)
########################

iwctl

# Inside iwctl:
# device list
# station wlan0 scan
# station wlan0 get-networks
# station wlan0 connect SSID
# exit

ping artixlinux.org

########################
# Sync clock
########################

dinitctl start chrony

########################
# Install base
########################

basestrap /mnt \
base base-devel \
dinit elogind-dinit \
linux linux-firmware \
iwd nano vim

########################
# Generate fstab
########################

fstabgen -U /mnt >> /mnt/etc/fstab

########################
# Chroot
########################

artix-chroot /mnt

########################
# Time
########################

ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc

########################
# Locale
########################

nano /etc/locale.gen

locale-gen

cat >/etc/locale.conf <<EOF
LANG=en_US.UTF-8
LC_COLLATE=C
EOF

########################
# Hostname
########################

echo myhostname >/etc/hostname

cat >/etc/hosts <<EOF
127.0.0.1 localhost
::1 localhost
127.0.1.1 myhostname.localdomain myhostname
EOF

########################
# Users
########################

passwd

useradd -m -G wheel user
passwd user

########################
# Bootloader (Limine)
########################

pacman -S limine efibootmgr

# Install Limine to ESP
cp -r /usr/share/limine/* /boot/efi/

# Create limine.conf
nano /boot/efi/limine.conf

# Create EFI boot entry
efibootmgr \
-c \
-d /dev/sda \
-p 1 \
-L "Limine" \
-l '\EFI\BOOT\BOOTX64.EFI'

########################
# Enable iwd
########################

ln -s ../iwd /etc/dinit.d/boot.d/

########################
# Finish
########################

exit
umount -R /mnt
reboot
