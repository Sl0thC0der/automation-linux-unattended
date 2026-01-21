#version=FEDORA
# Fedora Server Kickstart Configuration
# Unattended installation
text
skipx

# System language
lang en_US.UTF-8

# Keyboard layouts
keyboard --vckeymap=ch --xlayouts='ch'

# System timezone
timezone Europe/Zurich --utc

# Network information
network --bootproto=dhcp --device=link --onboot=yes --ipv6=auto --activate

# System authorization information
auth --enableshadow --passalgo=sha512

# Root password (disabled)
rootpw --lock

# User creation
user --name=adminlocal --password=$6$OOMiGCTiPHwsPn2s$E4CIiFi2pmpMgptJa.32ZiCJjZSIk13VJClZJGXtm6e8Af6uimjxwbW6C8EItKaowOifugeqDQb6kbkiRHasi/ --iscrypted --groups=wheel

# SELinux configuration
selinux --enforcing

# Firewall configuration
firewall --disabled

# System bootloader configuration
bootloader --location=mbr --append="crashkernel=auto"

# Initialize disk label
zerombr

# Partition clearing information
clearpart --all --initlabel

# Use first disk automatically
ignoredisk --only-use=sda

# Disk partitioning information
part /boot/efi --fstype=efi --size=512
part /boot --fstype=ext4 --size=2048
part / --fstype=xfs --grow

# Installation method
# Network installation:
# url --url="http://mirror.example.com/fedora/linux/releases/41/Server/x86_64/os/"
# OR for local media (USB/DVD):
cdrom

# Reboot after installation
reboot

# Package selection - Server installation (no GUI)
%packages
@^server-product-environment
# Additional useful packages
vim
wget
curl
net-tools
bind-utils
openssh-server
-@gnome-desktop
-@x11
%end

# Post-installation script
%post --log=/root/ks-post.log

# Add adminlocal to sudoers
echo "adminlocal ALL=(ALL) ALL" > /etc/sudoers.d/adminlocal
chmod 440 /etc/sudoers.d/adminlocal

# Update the system
dnf update -y

# Enable and start SSH
systemctl enable sshd
systemctl start sshd

%end
