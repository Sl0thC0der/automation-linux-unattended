#version=RHEL9
# Red Hat Enterprise Linux 9 Kickstart Configuration
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
user --name=adminlocal --password=$6$Mau97T9PvXrI.7np$9kOXF7BlTLTKzx5Cca6zCMQP89qZb1QM/3ZDJkPR1Nh0slC8EMcr8ZqViHT.52YN2jheM/jrpBVvxXoSLth7D. --iscrypted --groups=wheel

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
# url --url="http://mirror.example.com/rhel/9/BaseOS/x86_64/os/"
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
