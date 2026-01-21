# Fedora Server - Unattended Installation Files

This folder contains all files needed for automated Fedora Server installation.

## ⚠️ Important: Read Before Using

**Fedora is NOT for production critical systems!**

- 🚀 **Cutting-edge:** Latest features and packages
- ⚡ **Fast releases:** New version every ~6 months
- 📅 **Short lifecycle:** Only ~13 months support per version
- 🔬 **Purpose:** Development, testing, early adoption
- ⚠️ **Production:** Use Rocky Linux 9 or Ubuntu LTS instead

## 📁 Files in This Folder

- **fedora-kickstart.ks** - Main Kickstart configuration file
- **fedora-isolinux.cfg** - BIOS boot configuration (auto-start enabled)
- **fedora-grub.cfg** - UEFI boot configuration (auto-start enabled)
- **fedora-usb-creator.bat** - Windows automation script

## 🎯 Quick Start

### Using the Automation Script (Recommended)

1. **Download Fedora Server ISO:**
   - https://fedoraproject.org/server/download
   - Choose latest version (currently Fedora 41)

2. **Run the script:**
   - Double-click `fedora-usb-creator.bat`
   - Enter your Fedora version number (e.g., 41)
   - Follow the prompts

3. **Prerequisites:**
   - Rufus: https://rufus.ie/
   - USB drive (8GB+)

### Manual Method

1. **Create bootable USB with Rufus**
2. **Copy `fedora-kickstart.ks` to USB root**
3. **Boot and add parameter:**
   - `inst.ks=hd:LABEL=Fedora-S-dvd-x86_64-41:/fedora-kickstart.ks`
   - Replace `41` with your version number

## ⚙️ Configuration Details

Same as other distributions:

- **Language:** English (en_US.UTF-8)
- **Keyboard:** Swiss German (de-ch)
- **Timezone:** Europe/Zurich
- **Network:** DHCP
- **User:** adminlocal / Passwort2025*
- **Root:** Disabled
- **Installation:** Server (no GUI)
- **Firewall:** Disabled
- **SELinux:** Enforcing
- **Partitions:**
  - /boot/efi: 512 MB
  - /boot: 2 GB
  - / (root): Rest of disk (xfs)
  - No swap partition

## 📋 System Specifications

- **Distribution:** Fedora Server (Latest: 41)
- **Release Cycle:** Every 6 months
- **Support Length:** 13 months per version
- **Package Manager:** dnf
- **Kernel:** Latest (6.11 in Fedora 41)
- **Purpose:** Development, testing, bleeding edge

## 🔄 Fedora Release Schedule

```
Fedora 40  ████████░░░░░░░░░░░░  (EOL May 2025)
Fedora 41  ░░░░░░░░████████████  (EOL Nov 2025)
Fedora 42           ░░░░████████████  (Expected Apr 2025)
```

**You MUST upgrade every 6 months!**

## ✅ Advantages

- ✅ **Latest Packages:** Newest software versions
- ✅ **Modern Kernel:** Best hardware support
- ✅ **Free:** No subscription
- ✅ **Red Hat Backed:** Strong corporate support
- ✅ **RHEL Preview:** See future RHEL features
- ✅ **Active Community:** Large user base

## ⚠️ Disadvantages

- ⚠️ **Short Support:** Only 13 months
- ⚠️ **Frequent Upgrades:** Every 6 months required
- ⚠️ **Less Stable:** Cutting-edge = potential issues
- ⚠️ **Not for Production:** Critical systems need stability

## 🎓 Best For

### ✅ Good Use Cases

- **Development environments**
- **Testing latest technologies**
- **Learning newest Linux features**
- **CI/CD systems**
- **Personal projects**
- **Container development**
- **Preview future RHEL features**

### ❌ NOT Recommended For

- **Production databases**
- **Financial systems**
- **Critical infrastructure**
- **Long-term deployments**
- **Systems requiring stability**

**For production: Use Rocky Linux 9 or Ubuntu 24.04 LTS**

## 🔄 Upgrade Strategy

Fedora requires regular upgrades:

```bash
# Every ~6 months:
sudo dnf update -y
sudo dnf system-upgrade download --releasever=42
sudo dnf system-upgrade reboot
```

**Alternative:** Fresh install every 12-18 months

## 📚 Additional Documentation

- `../documentation/Fedora-README.md` - Complete Fedora guide
- `../documentation/COMPARISON.md` - Compare distributions
- `../MASTER-INDEX.md` - Complete overview

## 🔧 Post-Installation

```bash
# Login as adminlocal

# Check version
cat /etc/fedora-release

# Update system
sudo dnf update -y

# Enable automatic updates (recommended)
sudo dnf install -y dnf-automatic
sudo systemctl enable --now dnf-automatic.timer

# Enable firewall (optional)
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

## 🆘 Troubleshooting

**ISO label mismatch:**
- Common format: `Fedora-S-dvd-x86_64-XX` (XX = version)
- Check your ISO: Right-click → Properties
- Update in fedora-isolinux.cfg and fedora-grub.cfg

**Version too old:**
- Download latest Fedora version
- Older versions lose support quickly

## 📞 Support Resources

- Fedora Docs: https://docs.fedoraproject.org/
- Fedora Discussion: https://discussion.fedoraproject.org/
- Fedora Magazine: https://fedoramagazine.org/
- IRC: #fedora on Libera.Chat

## 📊 Fedora vs Alternatives

| Feature | Fedora | Rocky 9 | Ubuntu 24.04 |
|---------|---------|---------|--------------|
| Support | 13 months | 10 years | 5 years |
| Packages | Latest | Stable | Stable |
| Kernel | 6.11 | 5.14 | 6.8 |
| Upgrades | Every 6mo | Rarely | Every 2yr |
| Production | ❌ No | ✅ Yes | ✅ Yes |
| Development | ⭐ Best | ✅ Good | ✅ Good |

## 🚀 Fedora → RHEL Pipeline

Technologies in Fedora eventually move to RHEL:

```
Fedora 40-41 → RHEL 9.3+ (2024+)
Fedora 42-43 → RHEL 9.4+ (2025+)
```

**Fedora is where RHEL features are tested first!**

## 💡 When to Choose Fedora

**Choose Fedora if:**
- ✅ Development/testing environment
- ✅ Want latest features immediately
- ✅ Learning/experimentation
- ✅ Can commit to regular upgrades
- ✅ Need cutting-edge hardware support

**Choose Rocky Linux 9 if:**
- ✅ Production environment
- ✅ Need long-term stability
- ✅ Minimal administration preferred
- ✅ RHEL compatibility required

**Choose Ubuntu 24.04 LTS if:**
- ✅ Production environment
- ✅ Prefer Debian-based
- ✅ Need long support
- ✅ Wide software compatibility

---

**Ready for cutting-edge Linux?** Remember: Not for production! 🚀

**For production systems, use Rocky Linux 9 or Ubuntu 24.04 LTS instead.**
