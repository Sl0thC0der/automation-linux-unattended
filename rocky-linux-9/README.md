# Rocky Linux 9 - Unattended Installation Files

This folder contains all files needed for automated Rocky Linux 9 installation.

## 📁 Files in This Folder

- **rocky-kickstart.ks** - Main Kickstart configuration file
- **isolinux.cfg** - BIOS boot configuration (auto-start enabled)
- **grub.cfg** - UEFI boot configuration (auto-start enabled)
- **build-iso.bat** - Windows automation script for building custom ISO

## 🎯 Quick Start

### Method 1: Simple USB (Easiest)

1. **Create bootable USB with Rufus:**
   - Download Rocky Linux 9 ISO from: https://rockylinux.org/download
   - Use Rufus (https://rufus.ie/) to create bootable USB
   - Choose DD Image mode

2. **Add kickstart file:**
   - Copy `rocky-kickstart.ks` to the root of the USB drive

3. **Boot and install:**
   - Boot from USB
   - Press **Tab** (BIOS) or **e** (UEFI) at boot menu
   - Add to kernel line: `inst.ks=hd:LABEL=Rocky-9-BaseOS-x86_64:/rocky-kickstart.ks`
   - Press **Enter**

### Method 2: Custom ISO (Fully Automated)

1. **Run the automation script:**
   - Double-click `build-iso.bat`
   - Follow the prompts
   - It will extract, modify, and rebuild the ISO

2. **Prerequisites:**
   - 7-Zip: https://www.7-zip.org/
   - ImgBurn: https://www.imgburn.com/
   - Rocky Linux 9 ISO

## ⚙️ Configuration Details

This installation will configure:

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

- **Distribution:** Rocky Linux 9
- **Based On:** RHEL 9 (binary compatible)
- **Package Manager:** dnf
- **Init System:** systemd
- **Firewall:** firewalld (disabled by default)
- **Security:** SELinux (enforcing)
- **Support:** ~10 years (until ~2032)
- **Kernel:** 5.14

## ✅ Advantages

- ✅ **Free:** No subscription required
- ✅ **RHEL Compatible:** 1:1 binary compatibility
- ✅ **Long Support:** ~10 years of updates
- ✅ **Stable:** Enterprise-grade stability
- ✅ **No Vendor Lock-in:** Community-driven

## 🎓 Best For

- Production servers
- Enterprise environments without RHEL budget
- CentOS migrations
- Development/testing for RHEL deployments
- Long-term stable deployments

## 📚 Additional Documentation

For more detailed information, see:
- `../documentation/Windows-ISO-Creation-Guide.md` - Step-by-step Windows guide
- `../documentation/COMPARISON.md` - Compare with other distributions
- `../MASTER-INDEX.md` - Complete package overview

## 🔧 Customization

To modify the configuration:

1. **Edit rocky-kickstart.ks:**
   - Change timezone, keyboard, or language
   - Modify partitioning scheme
   - Add/remove packages
   - Change user credentials

2. **Update boot configs (isolinux.cfg and grub.cfg):**
   - Adjust timeout values
   - Modify ISO label if different

## 🆘 Troubleshooting

**Kickstart file not found:**
- Verify filename is exactly: `rocky-kickstart.ks`
- Check file is on USB root
- Verify USB label matches boot config: `Rocky-9-BaseOS-x86_64`

**Network issues:**
- Ensure DHCP is available on network
- For static IP, modify kickstart file

**Disk partitioning fails:**
- Check disk name (sda, nvme0n1, vda)
- Modify `ignoredisk` line in kickstart

## 📞 Support Resources

- Rocky Linux Docs: https://docs.rockylinux.org/
- Rocky Linux Forums: https://forums.rockylinux.org/
- IRC: #rocky on Libera.Chat

## 🔄 After Installation

```bash
# Login as adminlocal

# Verify system
cat /etc/rocky-release
hostnamectl

# Enable firewall (optional)
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

# Update system
sudo dnf update -y
```

## 📊 Rocky Linux vs Alternatives

| Feature | Rocky Linux 9 | RHEL 9 | Ubuntu 24.04 |
|---------|---------------|---------|--------------|
| Cost | Free | Paid | Free |
| Support | ~10 years | 10+ years | 5 years |
| RHEL Compatible | Yes | Yes | No |
| Commercial Support | Third-party | Red Hat | Canonical |

**Choose Rocky Linux if:** You need RHEL compatibility without subscription costs.

---

**Ready to install?** Boot from USB and watch the automated installation! 🚀
