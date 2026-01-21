# Ubuntu 24.04 LTS - Unattended Installation Files

This folder contains all files needed for automated Ubuntu 24.04 LTS Server installation.

## ⭐ Recommended Choice

**Ubuntu 24.04 LTS is recommended for most new installations:**
- Latest LTS release (April 2024)
- Supported until April 2029 (5 years)
- Extended support until 2034 with Ubuntu Pro
- Best hardware support
- Modern packages

## 📁 Files in This Folder

- **ubuntu2404-user-data** - Autoinstall configuration (cloud-init YAML)
- **ubuntu2404-meta-data** - Metadata file (required)
- **ubuntu2404-grub.cfg** - UEFI boot configuration (auto-start enabled)
- **ubuntu2404-usb-creator.bat** - Windows automation script

## 🎯 Quick Start

### Using the Automation Script (Easiest)

1. **Download Ubuntu 24.04 LTS ISO:**
   - https://ubuntu.com/download/server
   - Choose "Ubuntu 24.04 LTS"

2. **Run the script:**
   - Double-click `ubuntu2404-usb-creator.bat`
   - Follow the prompts
   - Script will set everything up automatically

3. **Prerequisites:**
   - Rufus: https://rufus.ie/
   - USB drive (8GB+)

### Manual Method

1. **Create bootable USB with Rufus**

2. **Create autoinstall folder:**
   - On USB: Create folder `autoinstall`

3. **Copy files (RENAME THEM!):**
   - Copy `ubuntu2404-user-data` → `USB:\autoinstall\user-data`
   - Copy `ubuntu2404-meta-data` → `USB:\autoinstall\meta-data`
   - **Note:** Remove version prefix when copying!

4. **Modify boot config:**
   - Edit `USB:\boot\grub\grub.cfg`
   - Or copy `ubuntu2404-grub.cfg` to `USB:\boot\grub\grub.cfg`

## ⚙️ Configuration Details

- **Language:** English (en_US.UTF-8)
- **Keyboard:** Swiss German (ch, de_nodeadkeys)
- **Timezone:** Europe/Zurich
- **Network:** DHCP
- **User:** adminlocal / Passwort2025*
- **Root:** Disabled
- **Installation:** Server (no GUI)
- **Firewall:** Disabled (ufw)
- **AppArmor:** Enabled
- **Partitions:**
  - /boot/efi: 512 MB (FAT32)
  - /boot: 2 GB (ext4)
  - / (root): Rest of disk (ext4)
  - No swap partition

## 📋 System Specifications

- **Distribution:** Ubuntu 24.04 LTS (Noble Numbat)
- **Release Date:** April 2024
- **Support Until:** April 2029 (Standard)
- **Extended Support:** April 2034 (with Ubuntu Pro)
- **Package Manager:** apt
- **Init System:** systemd
- **Firewall:** ufw (disabled by default)
- **Security:** AppArmor
- **Kernel:** 6.8
- **Python:** 3.12

## ✅ Advantages

- ✅ **Free:** No subscription required
- ✅ **Long Support:** 5 years (10 with Ubuntu Pro)
- ✅ **Latest Features:** Modern kernel and packages
- ✅ **Best Hardware Support:** Excellent driver support
- ✅ **Large Repository:** Huge software availability
- ✅ **Cloud Ready:** Default on AWS, Azure, GCP
- ✅ **Strong Community:** Very active user base
- ✅ **Excellent Documentation:** Comprehensive guides

## 🎓 Best For

- ✅ New server installations
- ✅ Production environments
- ✅ Cloud deployments (AWS, Azure, GCP)
- ✅ Modern applications
- ✅ Latest hardware (2023+)
- ✅ Docker/Kubernetes hosts
- ✅ Development servers
- ✅ General-purpose servers

## 🔄 Ubuntu Pro (Free for Personal Use)

**Extend support to 10 years:**

```bash
# Get free token: https://ubuntu.com/pro
sudo pro attach YOUR_TOKEN

# Benefits:
# - Extended security updates (ESM)
# - Kernel Livepatch
# - FIPS and compliance
# - Free for up to 5 machines
```

## 📚 Additional Documentation

- `../documentation/Ubuntu-All-Versions-Guide.md` - All Ubuntu versions
- `../documentation/Ubuntu-README.md` - Ubuntu 22.04 guide (similar)
- `../documentation/COMPARISON.md` - Compare distributions
- `../MASTER-INDEX.md` - Complete overview

## 🔧 Post-Installation

```bash
# Login as adminlocal

# Check version
lsb_release -a

# Verify installation
hostnamectl
df -h

# Update system
sudo apt update
sudo apt upgrade -y

# Enable firewall (optional)
sudo ufw enable
sudo ufw allow ssh
sudo ufw status

# Enable automatic updates (recommended)
sudo dpkg-reconfigure unattended-upgrades
```

## 🆘 Troubleshooting

**Autoinstall not found:**
- Verify folder name: `autoinstall` (lowercase)
- Check file names: `user-data` and `meta-data` (no version prefix!)
- Ensure grub.cfg has: `autoinstall ds=nocloud;s=/cdrom/autoinstall/`

**Partitioning fails:**
- Config assumes SSD/NVMe
- For HDD: Edit `ubuntu2404-user-data`, remove `ssd: true` line

## 📞 Support Resources

- Ubuntu Server Guide: https://ubuntu.com/server/docs
- Autoinstall Docs: https://ubuntu.com/server/docs/install/autoinstall
- Ubuntu Forums: https://ubuntuforums.org/
- Ask Ubuntu: https://askubuntu.com/

## 📊 Ubuntu 24.04 vs Alternatives

| Feature | Ubuntu 24.04 | Rocky 9 | Fedora |
|---------|--------------|---------|---------|
| Support | 5 years | 10 years | 13 months |
| Kernel | 6.8 | 5.14 | 6.11 |
| Packages | Latest stable | Stable | Bleeding edge |
| RHEL Compatible | No | Yes | Upstream |
| Cloud Ready | ⭐ Best | ✅ Good | ✅ Good |
| Hardware Support | ⭐ Excellent | ✅ Good | ⭐ Excellent |
| Ease of Use | ⭐ Easy | ✅ Good | ✅ Good |
| Production Ready | ✅ Yes | ✅ Yes | ⚠️ No |

## 💡 Why Choose Ubuntu 24.04?

**Choose Ubuntu 24.04 if:**
- ✅ Starting fresh installation
- ✅ Want latest stable features
- ✅ Need best hardware support
- ✅ Deploying to cloud
- ✅ Prefer Debian-based systems
- ✅ Want ease of use
- ✅ Need wide software availability

**Choose Rocky Linux 9 if:**
- ✅ Need RHEL compatibility
- ✅ Want longer support (10 years)
- ✅ Team knows RHEL/CentOS
- ✅ Migrating from CentOS

**Choose Ubuntu 22.04 if:**
- ✅ Want more proven stability
- ✅ Don't need cutting-edge features
- ✅ Maximum compatibility important

## 🔄 Upgrade Path

Ubuntu 24.04 → Ubuntu 26.04 → Ubuntu 28.04

**Long-term support cycle:**
```
Ubuntu 24.04 LTS ████████████████████ (2024-2029)
Ubuntu 26.04 LTS           ████████████████████ (2026-2031)
```

## 🌟 New Features in 24.04

- **Kernel 6.8:** Better hardware support
- **Python 3.12:** Latest Python
- **Security:** Enhanced AppArmor profiles
- **Performance:** Improved boot times
- **Networking:** Better network management
- **Containers:** Updated Docker/Podman support

## ⚡ Package Management

```bash
# Search packages
apt search package-name

# Install package
sudo apt install package-name

# Update all
sudo apt update && sudo apt upgrade -y

# Remove package
sudo apt remove package-name

# Clean up
sudo apt autoremove
```

---

**Ready to install?** Ubuntu 24.04 LTS is production-ready! 🚀

**This is the recommended choice for most new server installations.**
