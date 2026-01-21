# Ubuntu 22.04 Server Unattended Installation Package

This package contains everything you need for a fully automated Ubuntu 22.04 Server installation.

## Important: Ubuntu Uses Different System

**Ubuntu does NOT use Kickstart!** Ubuntu uses "autoinstall" which is based on cloud-init and YAML format.

## Files for Ubuntu 22.04

1. **ubuntu-user-data** - Autoinstall configuration (cloud-init YAML)
2. **ubuntu-meta-data** - Metadata file (required but minimal)
3. **ubuntu-grub.cfg** - UEFI boot configuration with auto-boot
4. **Ubuntu-README.md** - This file

## Installation Configuration

Same settings as Rocky Linux and RHEL:
- **Language:** English
- **Keyboard:** Swiss German (ch, de_nodeadkeys variant)
- **Timezone:** Europe/Zurich
- **Network:** DHCP (IPv4 and IPv6)
- **Root:** Disabled
- **User:** adminlocal / Passwort2025*
- **Installation:** Server (no GUI)
- **Firewall:** Disabled (ufw)
- **Partitions:** /boot/efi 512MB, /boot 2GB, / rest (ext4), no swap

## Prerequisites for Windows

1. **Ubuntu Server 22.04 ISO:** https://ubuntu.com/download/server
2. **7-Zip:** https://www.7-zip.org/
3. **xorriso for Windows:** https://www.gnu.org/software/xorriso/ (or use WSL)
4. **Rufus:** https://rufus.ie/ (for writing to USB)

## Method 1: Simple USB Method (Recommended)

This is the easiest method and doesn't require rebuilding the ISO.

### Steps:

1. **Create bootable USB with Rufus:**
   - Open Rufus
   - Select your USB drive (8GB+)
   - Select Ubuntu Server 22.04 ISO
   - Partition scheme: GPT for UEFI
   - Click "Start"

2. **Create autoinstall directory on USB:**
   - After Rufus completes, USB will be mounted
   - Create folder: `autoinstall` in the root of the USB
   - Copy `ubuntu-user-data` to `USB:\autoinstall\user-data` (rename!)
   - Copy `ubuntu-meta-data` to `USB:\autoinstall\meta-data` (rename!)

3. **Modify boot configuration:**
   - Navigate to `USB:\boot\grub\grub.cfg`
   - Open in Notepad
   - Find the first `menuentry` (usually "Install Ubuntu Server")
   - Find the line starting with `linux`
   - Add after `vmlinuz`: `autoinstall ds=nocloud;s=/cdrom/autoinstall/`
   
   Example:
   ```
   menuentry "Install Ubuntu Server" {
       set gfxpayload=keep
       linux /casper/vmlinuz autoinstall ds=nocloud;s=/cdrom/autoinstall/ quiet splash ---
       initrd /casper/initrd
   }
   ```

4. **Optional - Auto-boot:**
   - Find line: `set timeout=30`
   - Change to: `set timeout=1`

5. **Boot from USB:**
   - Boot the target system from USB
   - Installation starts automatically
   - No user interaction needed

## Method 2: Custom ISO (Fully Automated)

This method creates a custom ISO with autoinstall embedded.

### Using Windows with WSL (Windows Subsystem for Linux):

1. **Install WSL:**
   ```powershell
   wsl --install Ubuntu
   ```

2. **In WSL, install required tools:**
   ```bash
   sudo apt update
   sudo apt install -y xorriso genisoimage
   ```

3. **Extract the ISO:**
   ```bash
   mkdir ~/ubuntu-iso
   mkdir ~/ubuntu-extracted
   7z x /mnt/c/path/to/ubuntu-22.04-server-amd64.iso -o~/ubuntu-extracted
   ```

4. **Create autoinstall directory:**
   ```bash
   mkdir ~/ubuntu-extracted/autoinstall
   cp /mnt/c/path/to/ubuntu-user-data ~/ubuntu-extracted/autoinstall/user-data
   cp /mnt/c/path/to/ubuntu-meta-data ~/ubuntu-extracted/autoinstall/meta-data
   ```

5. **Update GRUB configuration:**
   ```bash
   # Backup original
   cp ~/ubuntu-extracted/boot/grub/grub.cfg ~/ubuntu-extracted/boot/grub/grub.cfg.bak
   
   # Copy our custom grub.cfg
   cp /mnt/c/path/to/ubuntu-grub.cfg ~/ubuntu-extracted/boot/grub/grub.cfg
   ```

6. **Create new ISO:**
   ```bash
   cd ~/ubuntu-extracted
   
   xorriso -as mkisofs \
     -r -V "Ubuntu 22.04 AutoInstall" \
     -J -joliet-long \
     -b boot/grub/i386-pc/eltorito.img \
     -c boot.catalog \
     -no-emul-boot \
     -boot-load-size 4 \
     -boot-info-table \
     -eltorito-alt-boot \
     -e boot/grub/efi.img \
     -no-emul-boot \
     -o ~/ubuntu-autoinstall.iso \
     .
   ```

7. **Copy ISO back to Windows:**
   ```bash
   cp ~/ubuntu-autoinstall.iso /mnt/c/Users/YourUsername/Downloads/
   ```

8. **Write to USB with Rufus:**
   - Use the custom ISO
   - Boot and it will auto-install

## Method 3: Manual Boot Parameter (Testing)

For testing or one-time use:

1. **Boot from standard Ubuntu USB**
2. **At boot menu, press 'e' to edit**
3. **Find the line starting with `linux`**
4. **Add:** `autoinstall ds=nocloud-net;s=http://your-server/autoinstall/`
5. **Press F10 to boot**

Note: This requires hosting user-data and meta-data on a web server.

## File Structure on USB/ISO

```
USB/ISO Root
├── autoinstall/
│   ├── user-data          (renamed from ubuntu-user-data)
│   └── meta-data          (renamed from ubuntu-meta-data)
├── boot/
│   └── grub/
│       └── grub.cfg       (modified for autoinstall)
└── casper/
    ├── vmlinuz
    └── initrd
```

## What Happens During Installation

1. System boots automatically (1 second timeout)
2. Autoinstall reads configuration from /cdrom/autoinstall/
3. Disk is partitioned automatically:
   - /boot/efi: 512 MB (FAT32)
   - /boot: 2 GB (ext4)
   - /: Rest of disk (ext4)
   - No swap
4. Ubuntu Server packages installed (no GUI)
5. System updates automatically
6. SSH enabled
7. Firewall (ufw) disabled
8. System reboots automatically
9. Login as: **adminlocal** / **Passwort2025***

## Key Differences from RHEL/Rocky

1. **Configuration Format:** YAML (cloud-init) instead of Kickstart
2. **File Names:** user-data and meta-data (no .ks extension)
3. **Boot Parameter:** `autoinstall ds=nocloud;s=/cdrom/autoinstall/`
4. **Filesystem:** ext4 by default (not xfs)
5. **Firewall:** ufw (not firewalld)
6. **Package Manager:** apt/dpkg (not dnf/rpm)
7. **No Subscription Required:** Ubuntu Server is free

## Testing the Configuration

**Before deploying to production, test in a VM:**

1. **VirtualBox or VMware:**
   - Create new VM
   - 2GB+ RAM, 20GB+ disk
   - Attach your custom USB/ISO
   - Boot and verify automated installation

2. **Verify after installation:**
   ```bash
   # Login as adminlocal
   # Check sudo access
   sudo whoami
   
   # Check timezone
   timedatectl
   
   # Check keyboard
   localectl
   
   # Check network
   ip addr
   
   # Check firewall (should be inactive)
   sudo ufw status
   
   # Check SSH
   systemctl status ssh
   ```

## Troubleshooting

**Installation doesn't start automatically:**
- Verify grub.cfg has `autoinstall` parameter
- Check timeout is set to 1
- Ensure user-data and meta-data are in /autoinstall/ folder

**Autoinstall not found:**
- Verify folder name is exactly `autoinstall` (lowercase)
- Verify files are named exactly `user-data` and `meta-data` (no extensions)
- Check the ds parameter: `ds=nocloud;s=/cdrom/autoinstall/`

**Disk partitioning fails:**
- The config assumes GPT and looks for SSD
- For HDD, modify storage config in user-data
- Remove or modify the `ssd: true` line

**Password doesn't work:**
- Verify password hash is correct
- Try generating new hash: `mkpasswd -m sha-512 YourPassword`
- Ensure quotes around hash in YAML

**Network issues:**
- Check interface names (en* pattern)
- May need to adjust for specific interface (ens18, enp0s3, etc.)

## Post-Installation

**1. Verify installation:**
```bash
sudo apt update
sudo apt upgrade -y
```

**2. Optional - Enable firewall:**
```bash
sudo ufw enable
sudo ufw allow ssh
sudo ufw status
```

**3. Optional - Install additional software:**
```bash
sudo apt install -y htop tmux tree
```

**4. Check system:**
```bash
df -h          # Disk usage
free -h        # Memory (no swap should show)
hostnamectl    # System info
```

## Advantages of Ubuntu Autoinstall

- ✅ No subscription required (free)
- ✅ Modern cloud-init based system
- ✅ Wide hardware compatibility
- ✅ Large software repository
- ✅ Strong community support
- ✅ Regular LTS updates (until 2027 for 22.04)

## Support Resources

- Ubuntu Server Guide: https://ubuntu.com/server/docs
- Autoinstall Documentation: https://ubuntu.com/server/docs/install/autoinstall
- Cloud-init Docs: https://cloudinit.readthedocs.io/
- Ubuntu Forums: https://ubuntuforums.org/
- Ask Ubuntu: https://askubuntu.com/

## Compatibility

This autoinstall configuration works with:
- Ubuntu 22.04 LTS Server (all point releases)
- Can be adapted for Ubuntu 20.04 LTS
- Can be adapted for Ubuntu 24.04 LTS (with minor changes)

## Notes

- Ubuntu 22.04 LTS supported until April 2027
- Extended security updates available until 2032 with Ubuntu Pro (free for personal use)
- Autoinstall is the official method since Ubuntu 20.04
- Old debian-installer and preseed are deprecated
