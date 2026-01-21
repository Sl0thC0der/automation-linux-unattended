# Red Hat Enterprise Linux 9 - Unattended Installation Files

This folder contains all files needed for automated RHEL 9 installation.

## 📁 Files in This Folder

- **rhel9-kickstart.ks** - Main Kickstart configuration file
- **rhel9-isolinux.cfg** - BIOS boot configuration (auto-start enabled)
- **rhel9-grub.cfg** - UEFI boot configuration (auto-start enabled)

## 🔑 Important: Subscription Required

**RHEL requires a valid Red Hat subscription** after installation.

**Getting RHEL:**
- Download ISO from: https://access.redhat.com/downloads/
- Requires Red Hat account
- **Free option:** Red Hat Developer Subscription (https://developers.redhat.com/)
  - Includes 16 systems
  - No time limit
  - Perfect for development/testing

## 🎯 Quick Start

### Method 1: Simple USB (Recommended)

1. **Create bootable USB with Rufus:**
   - Download RHEL 9 ISO from Red Hat portal
   - Use Rufus (https://rufus.ie/)
   - Choose DD Image mode

2. **Add kickstart file:**
   - Copy `rhel9-kickstart.ks` to USB root

3. **Boot and install:**
   - Boot from USB
   - Press **Tab** (BIOS) or **e** (UEFI)
   - Add: `inst.ks=hd:LABEL=RHEL-9-BaseOS-x86_64:/rhel9-kickstart.ks`
   - Press **Enter**

### Method 2: Custom ISO (Fully Automated)

Same process as Rocky Linux, but use RHEL files:
1. Extract RHEL 9 ISO with 7-Zip
2. Copy kickstart and boot configs
3. Rebuild ISO with ImgBurn
4. See `../documentation/Windows-ISO-Creation-Guide.md`

## ⚙️ Configuration Details

Identical to Rocky Linux 9:

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

- **Distribution:** Red Hat Enterprise Linux 9
- **Package Manager:** dnf
- **Init System:** systemd
- **Firewall:** firewalld (disabled by default)
- **Security:** SELinux (enforcing)
- **Support:** 10+ years
- **Kernel:** 5.14

## ✅ Advantages

- ✅ **Official Support:** Red Hat vendor support
- ✅ **Certifications:** Security certifications (Common Criteria, FIPS)
- ✅ **Long Support:** 10+ years
- ✅ **Enterprise Ready:** Industry standard
- ✅ **Extensive Documentation:** Professional documentation

## 💰 Subscription Information

**Free Developer Subscription:**
- 16 systems included
- No cost, no time limit
- Full RHEL experience
- Register at: https://developers.redhat.com/

**Commercial Subscriptions:**
- Standard: ~$349/year per system
- Premium: ~$1,299/year per system
- Includes support and updates

## 🎓 Best For

- Enterprise production environments
- Organizations requiring vendor support
- Regulated industries (finance, healthcare, government)
- Compliance requirements
- Mission-critical systems

## 🔄 Post-Installation: Register System

**CRITICAL:** You must register after installation:

```bash
# Login as adminlocal

# Register with Red Hat
sudo subscription-manager register --username YOUR_USERNAME
# You'll be prompted for password

# Attach subscription
sudo subscription-manager attach --auto

# Verify registration
sudo subscription-manager status

# Update system
sudo dnf update -y
```

## 📚 Additional Documentation

- `../documentation/Windows-ISO-Creation-Guide.md` - Windows guide
- `../documentation/RHEL9-README.md` - Detailed RHEL guide
- `../documentation/COMPARISON.md` - Compare distributions
- `../MASTER-INDEX.md` - Complete overview

## 🔧 Customization

Same as Rocky Linux - edit `rhel9-kickstart.ks` to customize:
- User credentials
- Timezone and keyboard
- Partitioning
- Package selection

## 🆘 Troubleshooting

**Subscription issues:**
```bash
# Clear and re-register
sudo subscription-manager clean
sudo subscription-manager register
```

**ISO label mismatch:**
- Check actual label: Right-click ISO → Properties
- Common: `RHEL-9-BaseOS-x86_64` or `RHEL-9-0-BaseOS-x86_64`
- Update in rhel9-isolinux.cfg and rhel9-grub.cfg

## 📞 Support Resources

- Red Hat Customer Portal: https://access.redhat.com/
- Documentation: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9
- Support: Commercial support contracts
- Developer Community: https://developers.redhat.com/

## 📊 RHEL 9 vs Alternatives

| Feature | RHEL 9 | Rocky Linux 9 | Ubuntu 24.04 |
|---------|---------|---------------|--------------|
| Cost | Subscription | Free | Free |
| Support | Red Hat | Community | Community/Pro |
| Certifications | Yes | No | Limited |
| Commercial Vendor | Yes | Third-party | Canonical |
| Best For | Enterprise | Free RHEL-like | General use |

**Choose RHEL 9 if:** You need official support, certifications, and can budget for subscriptions.

**Consider Rocky Linux 9 if:** You want RHEL compatibility without cost.

---

**Ready to install?** Don't forget to register your system after installation! 🚀
