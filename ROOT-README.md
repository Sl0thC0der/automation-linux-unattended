# Linux Unattended Installation - Complete Package

**Fully automated (zero-touch) installation configurations for 6 major Linux distributions.**

All configurations use identical settings - same user, password, partitions, timezone, and keyboard layout. Choose the distribution that fits your needs, and let automation handle the rest!

---

## 🎯 Quick Selection Guide

### For New Production Servers

| Your Need | Recommended Choice |
|-----------|-------------------|
| **Latest features + Long support** | 🥇 Ubuntu 24.04 LTS |
| **Proven stability** | 🥈 Ubuntu 22.04 LTS |
| **RHEL compatibility (free)** | 🥈 Rocky Linux 9 |
| **Enterprise support** | RHEL 9 |
| **Development/Testing** | Fedora Server or Ubuntu 24.04 |

### ❌ Not Recommended

- **Ubuntu 20.04 LTS** - Support ends April 2025 (6 months!)
- **Fedora Server** - For production (too short support cycle)

---

## 📦 What's Included

This package contains complete unattended installation files for:

### 🔴 Enterprise Linux (RHEL-based)

1. **Rocky Linux 9** - Free, RHEL-compatible, 10-year support
   - Perfect for production without subscription costs
   - See: `rocky-linux-9/`

2. **RHEL 9** - Enterprise, official Red Hat support
   - For organizations requiring vendor support
   - See: `rhel-9/`

3. **Fedora Server** - Cutting-edge, 13-month support ⚠️
   - For development and testing ONLY
   - See: `fedora-server/`

### 🟠 Debian-based

4. **Ubuntu 24.04 LTS** ⭐ - Latest LTS, supported until 2029
   - **RECOMMENDED** for most new installations
   - See: `ubuntu-24.04-lts/`

5. **Ubuntu 22.04 LTS** - Current standard, supported until 2027
   - Proven stability, wide compatibility
   - See: `ubuntu-22.04-lts/`

6. **Ubuntu 20.04 LTS** ⚠️ - Support ends April 2025
   - **NOT RECOMMENDED** - Use 22.04 or 24.04 instead
   - See: `ubuntu-20.04-lts/`

---

## 📂 File Structure

```
.
├── README.md (this file)
├── MASTER-INDEX.md (complete documentation)
│
├── rocky-linux-9/
│   ├── README.md
│   ├── rocky-kickstart.ks
│   ├── isolinux.cfg
│   ├── grub.cfg
│   └── build-iso.bat
│
├── rhel-9/
│   ├── README.md
│   ├── rhel9-kickstart.ks
│   ├── rhel9-isolinux.cfg
│   └── rhel9-grub.cfg
│
├── fedora-server/
│   ├── README.md
│   ├── fedora-kickstart.ks
│   ├── fedora-isolinux.cfg
│   ├── fedora-grub.cfg
│   └── fedora-usb-creator.bat
│
├── ubuntu-24.04-lts/ ⭐ RECOMMENDED
│   ├── README.md
│   ├── ubuntu2404-user-data
│   ├── ubuntu2404-meta-data
│   ├── ubuntu2404-grub.cfg
│   └── ubuntu2404-usb-creator.bat
│
├── ubuntu-22.04-lts/
│   ├── README.md
│   ├── ubuntu-user-data
│   ├── ubuntu-meta-data
│   ├── ubuntu-grub.cfg
│   └── ubuntu-usb-creator.bat
│
├── ubuntu-20.04-lts/ ⚠️ NOT RECOMMENDED
│   ├── README.md
│   ├── ubuntu2004-user-data
│   ├── ubuntu2004-meta-data
│   ├── ubuntu2004-grub.cfg
│   └── ubuntu2004-usb-creator.bat
│
└── documentation/
    ├── Windows-ISO-Creation-Guide.md
    ├── Ubuntu-All-Versions-Guide.md
    ├── COMPARISON.md
    ├── Fedora-README.md
    ├── RHEL9-README.md
    └── Ubuntu-README.md
```

---

## ⚙️ Common Configuration (All Distributions)

All 6 distributions are configured identically:

| Setting | Value |
|---------|-------|
| **Language** | English (en_US.UTF-8) |
| **Keyboard** | Swiss German (de-ch) |
| **Timezone** | Europe/Zurich |
| **Network** | DHCP (IPv4/IPv6) |
| **Username** | adminlocal |
| **Password** | Passwort2025* |
| **Root Account** | Disabled |
| **Installation** | Server (no GUI) |
| **Firewall** | Disabled (enable after install) |
| **SSH** | Enabled |
| **Partitions** | /boot/efi: 512MB, /boot: 2GB, /: rest |
| **Swap** | None |

**💡 Choose based on distribution needs, not configuration - they're all the same!**

---

## 🚀 Getting Started (3 Easy Steps)

### Step 1: Choose Your Distribution

Navigate to the appropriate folder based on the Quick Selection Guide above.

### Step 2: Read the README

Each folder has its own README.md with specific instructions:
- Quick start guide
- Prerequisites
- Automation scripts
- Troubleshooting

### Step 3: Create Your Installation Media

**Option A: Use the automation script** (easiest)
- Rocky Linux: Use `build-iso.bat`
- Fedora: Use `fedora-usb-creator.bat`
- Ubuntu 24.04: Use `ubuntu2404-usb-creator.bat`
- Ubuntu 22.04: Use `ubuntu-usb-creator.bat`
- Ubuntu 20.04: Use `ubuntu2004-usb-creator.bat`

**Option B: Manual USB creation**
- Follow the README in each distribution folder
- See `documentation/Windows-ISO-Creation-Guide.md`

---

## 📊 Quick Comparison

| Feature | Rocky 9 | RHEL 9 | Fedora | Ubuntu 24.04 | Ubuntu 22.04 |
|---------|---------|---------|---------|--------------|--------------|
| **Cost** | Free | Paid | Free | Free | Free |
| **Support** | 10 yrs | 10+ yrs | 13 mo ⚠️ | 5 yrs | 5 yrs |
| **Config Type** | Kickstart | Kickstart | Kickstart | Autoinstall | Autoinstall |
| **Package Mgr** | dnf | dnf | dnf | apt | apt |
| **Kernel** | 5.14 | 5.14 | 6.11 | 6.8 | 5.15 |
| **RHEL Compatible** | Yes | Yes | Upstream | No | No |
| **Production** | ✅ Yes | ✅ Yes | ⚠️ No | ✅ Yes | ✅ Yes |
| **Best For** | Free RHEL | Enterprise | Dev/Test | Latest | Stable |

---

## 🛠️ Prerequisites (Windows)

### Required for All Methods

1. **Rufus** - USB creation tool
   - Download: https://rufus.ie/
   - Free, portable, easy to use

2. **7-Zip** - Extract ISO files
   - Download: https://www.7-zip.org/
   - Required for custom ISO method

### Optional for Custom ISO

3. **ImgBurn** - Create custom ISO files
   - Download: https://www.imgburn.com/
   - Only needed for fully automated ISO

---

## 📖 Documentation Guide

### Start Here
- **This README** - Overview and quick start
- **MASTER-INDEX.md** - Complete documentation index

### Distribution-Specific
- Each distribution folder has its own detailed README
- Follow the specific instructions for your chosen distribution

### Advanced Topics
- `documentation/Windows-ISO-Creation-Guide.md` - Detailed Windows guide
- `documentation/COMPARISON.md` - In-depth comparison
- `documentation/Ubuntu-All-Versions-Guide.md` - All Ubuntu versions
- `documentation/Fedora-README.md` - Fedora details
- `documentation/RHEL9-README.md` - RHEL details

---

## ✅ Tested and Production-Ready

All configurations in this package are:
- ✅ **Fully tested** in virtual machines and physical hardware
- ✅ **Production-ready** (except Fedora - dev/test only)
- ✅ **Security-conscious** (root disabled, firewall available)
- ✅ **Well-documented** (comprehensive guides)
- ✅ **Automated** (zero-touch installation)

---

## 🎓 Use Cases

### Choose Rocky Linux 9 if you need:
- RHEL compatibility without cost
- Long-term support (10 years)
- Enterprise stability
- CentOS replacement
- Production servers

### Choose RHEL 9 if you need:
- Official Red Hat support
- Security certifications
- Vendor relationships
- Compliance requirements
- Mission-critical systems

### Choose Fedora Server if you need:
- Latest packages and features
- Development environments
- Testing ground for RHEL
- Learning newest Linux tech
- **NOT for production!**

### Choose Ubuntu 24.04 LTS if you need:
- Latest LTS (recommended)
- Modern kernel (6.8)
- Best hardware support
- Cloud deployments
- Modern packages

### Choose Ubuntu 22.04 LTS if you need:
- Proven stability
- Maximum compatibility
- Current standard
- Risk-averse environments

### Avoid Ubuntu 20.04 LTS:
- ⚠️ Support ends April 2025
- ⚠️ Old kernel and packages
- ⚠️ Use 22.04 or 24.04 instead

---

## ⚡ Quick Installation Example

1. **Choose distribution:** Ubuntu 24.04 LTS (recommended)
2. **Navigate to folder:** `cd ubuntu-24.04-lts`
3. **Read README:** `README.md`
4. **Download ISO:** https://ubuntu.com/download/server
5. **Run script:** Double-click `ubuntu2404-usb-creator.bat`
6. **Follow prompts:** Script does everything
7. **Boot from USB:** Fully automated installation!
8. **Login:** Username: adminlocal, Password: Passwort2025*

**Total time:** 5 minutes setup + 15 minutes installation = Done! 🎉

---

## 🆘 Troubleshooting

### Installation doesn't start
- Check BIOS boot order
- Verify secure boot settings
- Try different USB port

### Kickstart/Autoinstall not found
- Verify file names match exactly
- Check USB label matches config
- See distribution-specific README

### Network issues
- Ensure DHCP available
- Check network cable
- Verify interface name in config

### Partitioning fails
- Check disk is detected
- Verify disk name (sda, nvme0n1, vda)
- Modify ignoredisk parameter

**For detailed troubleshooting, see each distribution's README.**

---

## 📞 Support Resources

### Official Documentation
- Rocky Linux: https://docs.rockylinux.org/
- RHEL: https://access.redhat.com/documentation/
- Fedora: https://docs.fedoraproject.org/
- Ubuntu: https://ubuntu.com/server/docs

### Community Support
- Rocky Forums: https://forums.rockylinux.org/
- Fedora Discussion: https://discussion.fedoraproject.org/
- Ubuntu Forums: https://ubuntuforums.org/
- Ask Ubuntu: https://askubuntu.com/

---

## 🔒 Security Notes

### By Design
- ✅ Root account disabled (use sudo)
- ✅ Strong password configured
- ✅ SSH enabled for remote management
- ✅ SELinux/AppArmor enabled
- ⚠️ Firewall disabled initially (enable after install)

### Post-Installation Security Hardening

```bash
# Enable firewall
sudo systemctl enable --now firewalld  # Rocky/RHEL/Fedora
sudo ufw enable                         # Ubuntu

# Allow SSH
sudo firewall-cmd --permanent --add-service=ssh  # Rocky/RHEL/Fedora
sudo ufw allow ssh                               # Ubuntu

# Set up SSH keys (recommended)
ssh-keygen -t ed25519
# Copy public key to server
# Disable password authentication

# Enable automatic security updates
# Rocky/RHEL/Fedora: dnf-automatic
# Ubuntu: unattended-upgrades
```

---

## 🎉 Ready to Install!

You now have everything needed for automated Linux installations!

### Next Steps:
1. ✅ Choose your distribution (Ubuntu 24.04 LTS recommended)
2. ✅ Navigate to that folder
3. ✅ Read the folder's README.md
4. ✅ Download the distribution's ISO
5. ✅ Run the automation script (or manual method)
6. ✅ Boot and watch it install automatically!

**Questions?** Check:
- Distribution-specific README in each folder
- MASTER-INDEX.md for complete overview
- documentation/ folder for detailed guides

---

## 📝 Version Information

- **Package Version:** 1.0
- **Created:** October 2025
- **Distributions Included:** 6
- **Total Files:** 30+
- **Documentation Pages:** 10+

---

## 📄 License

These configuration files are provided as-is for educational and production use.
Feel free to modify and adapt for your needs.

---

**Happy Installing! 🚀**

**For the best experience, we recommend Ubuntu 24.04 LTS for most users.**

Need help? Start with your distribution's README.md or see MASTER-INDEX.md for the complete guide.
