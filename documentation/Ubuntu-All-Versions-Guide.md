# Ubuntu Autoinstall - All LTS Versions Guide

This guide covers automated installation for all supported Ubuntu LTS versions.

## Supported Ubuntu Versions

### Ubuntu 24.04 LTS (Noble Numbat) ⭐ NEWEST
- **Released:** April 2024
- **Supported Until:** April 2029 (5 years)
- **Extended Support:** April 2034 (10 years with Ubuntu Pro)
- **Kernel:** 6.8
- **Files:** ubuntu2404-user-data, ubuntu2404-meta-data, ubuntu2404-grub.cfg

### Ubuntu 22.04 LTS (Jammy Jellyfish)
- **Released:** April 2022
- **Supported Until:** April 2027 (5 years)
- **Extended Support:** April 2032 (10 years with Ubuntu Pro)
- **Kernel:** 5.15
- **Files:** ubuntu-user-data, ubuntu-meta-data, ubuntu-grub.cfg

### Ubuntu 20.04 LTS (Focal Fossa)
- **Released:** April 2020
- **Supported Until:** April 2025 (5 years)
- **Extended Support:** April 2030 (10 years with Ubuntu Pro)
- **Kernel:** 5.4
- **Files:** ubuntu2004-user-data, ubuntu2004-meta-data, ubuntu2004-grub.cfg

## Quick Reference Table

| Version | Release | End of Support | Files Prefix | Recommended For |
|---------|---------|----------------|--------------|-----------------|
| 24.04 LTS | Apr 2024 | Apr 2029 | ubuntu2404- | New deployments |
| 22.04 LTS | Apr 2022 | Apr 2027 | ubuntu- | Current standard |
| 20.04 LTS | Apr 2020 | Apr 2025 | ubuntu2004- | Legacy systems |

## Common Configuration (All Versions)

All three versions share identical settings:
- ✅ Language: English (en_US.UTF-8)
- ✅ Keyboard: Swiss German (ch, de_nodeadkeys)
- ✅ Timezone: Europe/Zurich
- ✅ Network: DHCP (IPv4 and IPv6)
- ✅ Root: Disabled
- ✅ User: adminlocal / Passwort2025*
- ✅ Server installation (no GUI)
- ✅ Firewall: Disabled (ufw)
- ✅ Partitions: /boot/efi 512MB, /boot 2GB, / rest (ext4)
- ✅ No swap
- ✅ SSH enabled
- ✅ Auto-update during installation

## Key Differences Between Versions

### Ubuntu 24.04 LTS (Newest)
**What's New:**
- Latest kernel (6.8) - better hardware support
- Updated packages and security features
- Improved cloud-init
- Better ARM64 support
- netplan 1.0
- Python 3.12

**Package Differences:**
- Uses `bind9-dnsutils` (was `bind9-host` in 20.04)
- Newer systemd features
- Updated OpenSSH

**Best For:**
- ✅ New installations
- ✅ Latest hardware
- ✅ Modern software stacks
- ✅ Longest support timeline

### Ubuntu 22.04 LTS (Current Standard)
**Features:**
- Stable and well-tested
- Wide software compatibility
- Good hardware support (kernel 5.15)
- Large community knowledge base
- Python 3.10

**Package Differences:**
- Uses `bind9-utils` package
- Mature package ecosystem

**Best For:**
- ✅ Current production deployments
- ✅ Proven stability needed
- ✅ Maximum software compatibility
- ✅ Balance of new and stable

### Ubuntu 20.04 LTS (Older, Still Supported)
**Considerations:**
- ⚠️ Support ends April 2025 (6 months away!)
- Older kernel (5.4) - limited new hardware support
- Older packages
- Python 3.8

**Package Differences:**
- Uses `bind9-host` package
- Slightly different cloud-init behavior
- Requires explicit timezone and user setup in late-commands

**Best For:**
- ⚠️ Only for existing 20.04 environments
- ⚠️ Legacy application requirements
- ⚠️ Consider upgrading to 22.04 or 24.04

## Installation Instructions (Same for All Versions)

### Method 1: Simple USB (Recommended)

Works identically for all three versions:

1. **Create bootable USB with Rufus:**
   - Use the appropriate Ubuntu Server ISO (20.04, 22.04, or 24.04)
   - GPT partition scheme

2. **Create autoinstall directory:**
   - Create folder `autoinstall` on USB root

3. **Copy the correct files:**
   - For **24.04**: Copy `ubuntu2404-user-data` → `USB:\autoinstall\user-data`
   - For **24.04**: Copy `ubuntu2404-meta-data` → `USB:\autoinstall\meta-data`
   - For **22.04**: Copy `ubuntu-user-data` → `USB:\autoinstall\user-data`
   - For **22.04**: Copy `ubuntu-meta-data` → `USB:\autoinstall\meta-data`
   - For **20.04**: Copy `ubuntu2004-user-data` → `USB:\autoinstall\user-data`
   - For **20.04**: Copy `ubuntu2004-meta-data` → `USB:\autoinstall\meta-data`

4. **Modify grub.cfg:**
   - Edit `USB:\boot\grub\grub.cfg`
   - Or copy the appropriate pre-configured file:
     - `ubuntu2404-grub.cfg` for 24.04
     - `ubuntu-grub.cfg` for 22.04
     - `ubuntu2004-grub.cfg` for 20.04

5. **Boot and install automatically**

### Method 2: Automated Script

Use the appropriate batch script for each version:

**For Ubuntu 24.04:**
```batch
ubuntu2404-usb-creator.bat
```

**For Ubuntu 22.04:**
```batch
ubuntu-usb-creator.bat
```

**For Ubuntu 20.04:**
```batch
ubuntu2004-usb-creator.bat
```

## Which Version Should You Choose?

### Choose Ubuntu 24.04 LTS if:
✅ Starting fresh installations
✅ Need latest hardware support
✅ Want longest support (until 2029)
✅ Need modern packages
✅ No legacy application constraints

### Choose Ubuntu 22.04 LTS if:
✅ Need proven stability
✅ Maximum software compatibility important
✅ Current standard in many enterprises
✅ Don't need bleeding-edge features
✅ Good balance of new and stable

### Choose Ubuntu 20.04 LTS if:
⚠️ **NOT RECOMMENDED** for new installations
⚠️ Support ends April 2025 (very soon!)
⚠️ Only if you absolutely must match existing infrastructure
✅ Consider upgrading to 22.04 or 24.04 instead

## Upgrade Paths

### From 20.04 → 22.04
```bash
sudo apt update
sudo apt upgrade -y
sudo do-release-upgrade
```

### From 22.04 → 24.04
```bash
sudo apt update
sudo apt upgrade -y
sudo do-release-upgrade
```

### From 20.04 → 24.04 (Skip 22.04)
```bash
# Not directly supported
# Must upgrade 20.04 → 22.04 → 24.04
```

## Package Manager Commands (Same for All)

All versions use the same apt commands:

```bash
# Update package list
sudo apt update

# Upgrade packages
sudo apt upgrade -y

# Install package
sudo apt install package-name

# Remove package
sudo apt remove package-name

# Search packages
apt search package-name

# Show package info
apt show package-name
```

## Post-Installation Verification

Same verification for all versions:

```bash
# Check version
lsb_release -a

# Check kernel
uname -r

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

# Check disk layout
lsof
df -h
```

## Ubuntu Pro (Free for Personal Use)

Available for all three LTS versions:

**Benefits:**
- Extended Security Maintenance (ESM)
- 10 years total support instead of 5
- Kernel Livepatch
- FIPS and Common Criteria compliance

**How to Enable (Free for up to 5 machines):**
```bash
# Get free token from: https://ubuntu.com/pro
sudo pro attach YOUR_TOKEN
```

**Support Extensions:**
- 20.04: Extended until 2030
- 22.04: Extended until 2032
- 24.04: Extended until 2034

## Hardware Compatibility

### Ubuntu 24.04
- ✅ Best support for new hardware (2023-2024)
- ✅ Latest drivers
- ✅ Better ARM64 support
- ✅ Improved laptop support

### Ubuntu 22.04
- ✅ Good support for hardware from 2020-2023
- ✅ Stable drivers
- ✅ Wide compatibility

### Ubuntu 20.04
- ⚠️ Limited support for newest hardware (2023+)
- ⚠️ May need additional drivers
- ⚠️ Some new devices not recognized

## Cloud Support

All three versions supported on:
- ✅ AWS (Amazon Web Services)
- ✅ Azure (Microsoft)
- ✅ GCP (Google Cloud Platform)
- ✅ Oracle Cloud
- ✅ IBM Cloud
- ✅ DigitalOcean
- ✅ Linode

**Note:** 24.04 has optimized cloud images

## Container Support

### Ubuntu 24.04
- Docker: Latest
- Kubernetes: 1.29+
- LXD: 5.21+

### Ubuntu 22.04
- Docker: Latest
- Kubernetes: 1.28+
- LXD: 5.0+

### Ubuntu 20.04
- Docker: Latest
- Kubernetes: 1.27
- LXD: 4.0+

## Development Tools

### Python Versions
- 24.04: Python 3.12
- 22.04: Python 3.10
- 20.04: Python 3.8

### Other Languages
All versions support latest:
- Go, Rust, Node.js, Ruby, PHP, Java
- Install via apt or snap

## Security Features

All versions include:
- ✅ AppArmor enabled by default
- ✅ Secure Boot support
- ✅ Unattended upgrades (optional)
- ✅ UFW firewall
- ✅ fail2ban compatible

## Migration Recommendations

**If currently on 20.04:**
→ Upgrade to 24.04 NOW (support ends April 2025)

**If currently on 22.04:**
→ Stay on 22.04 (supported until 2027)
→ Or upgrade to 24.04 for latest features

**Starting fresh:**
→ Use 24.04 LTS for new installations

## File Organization

```
outputs/
├── Ubuntu 24.04 LTS Files:
│   ├── ubuntu2404-user-data
│   ├── ubuntu2404-meta-data
│   ├── ubuntu2404-grub.cfg
│   └── ubuntu2404-usb-creator.bat
│
├── Ubuntu 22.04 LTS Files:
│   ├── ubuntu-user-data
│   ├── ubuntu-meta-data
│   ├── ubuntu-grub.cfg
│   └── ubuntu-usb-creator.bat
│
└── Ubuntu 20.04 LTS Files:
    ├── ubuntu2004-user-data
    ├── ubuntu2004-meta-data
    ├── ubuntu2004-grub.cfg
    └── ubuntu2004-usb-creator.bat
```

## Support and Resources

**Official:**
- Ubuntu Releases: https://wiki.ubuntu.com/Releases
- Ubuntu Server Guide: https://ubuntu.com/server/docs
- Autoinstall Docs: https://ubuntu.com/server/docs/install/autoinstall

**Community:**
- Ubuntu Forums: https://ubuntuforums.org/
- Ask Ubuntu: https://askubuntu.com/
- IRC: #ubuntu-server on Libera.Chat

## Summary

| Aspect | 24.04 LTS | 22.04 LTS | 20.04 LTS |
|--------|-----------|-----------|-----------|
| **Recommendation** | ⭐ Best choice | ✅ Good choice | ⚠️ Not recommended |
| **New Hardware** | Excellent | Good | Limited |
| **Stability** | Very Good | Excellent | Excellent |
| **Support Until** | 2029 | 2027 | 2025 (6 months!) |
| **Use Case** | New deployments | Current standard | Legacy only |

**Bottom Line:**
- 🏆 **Use 24.04** for all new installations
- ✅ **Stay on 22.04** if already deployed and stable
- ⚠️ **Upgrade from 20.04** before April 2025!
