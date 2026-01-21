# Complete Unattended Installation Package - Master Index

This package provides fully automated (unattended) installation configurations for multiple Linux distributions.

## 📦 What's Included

### Enterprise Linux (RHEL-based)
1. **Rocky Linux 9** - Free, RHEL-compatible
2. **Red Hat Enterprise Linux 9** - Enterprise, subscription required
3. **Fedora Server** - Cutting-edge, latest features

### Debian-based
4. **Ubuntu 24.04 LTS** - Newest LTS (2024-2029)
5. **Ubuntu 22.04 LTS** - Current standard (2022-2027)
6. **Ubuntu 20.04 LTS** - Older LTS (2020-2025) ⚠️ Support ending soon

## 🎯 Quick Selection Guide

### For New Installations

**Choose Ubuntu 24.04 LTS if:**
- ✅ You want the newest features
- ✅ You have latest hardware (2023+)
- ✅ You prefer Debian-based systems
- ✅ You want longest support timeline
- ✅ No specific RHEL requirement

**Choose Rocky Linux 9 if:**
- ✅ You need RHEL compatibility
- ✅ You're migrating from CentOS
- ✅ Your team knows RHEL/CentOS
- ✅ You want enterprise stability
- ✅ You don't want subscription costs

**Choose RHEL 9 if:**
- ✅ You need official vendor support
- ✅ You have compliance requirements
- ✅ You're in regulated industry
- ✅ Budget allows subscriptions
- ✅ You need security certifications

**Choose Fedora Server if:**
- ✅ Development/testing environments
- ✅ Want cutting-edge features
- ✅ Learning newest technologies
- ✅ Can handle frequent upgrades (every 6 months)
- ✅ Preview future RHEL features
- ⚠️ NOT for production critical systems

**Choose Ubuntu 22.04 LTS if:**
- ✅ You want proven stability
- ✅ You prefer current standard
- ✅ Maximum compatibility important
- ✅ Balance of new and stable

**❌ Avoid Ubuntu 20.04 LTS:**
- ⚠️ Support ends April 2025 (very soon!)
- ⚠️ Only for legacy requirements
- ⚠️ Consider upgrading instead

## 📁 File Organization

### Rocky Linux 9 Files
```
rocky-kickstart.ks           - Kickstart configuration
isolinux.cfg                  - BIOS boot config
grub.cfg                      - UEFI boot config
build-iso.bat                 - Windows automation
README.md                     - Rocky Linux guide
```

### RHEL 9 Files
```
rhel9-kickstart.ks           - Kickstart configuration
rhel9-isolinux.cfg           - BIOS boot config
rhel9-grub.cfg               - UEFI boot config
RHEL9-README.md              - RHEL guide
```

### Fedora Server Files
```
fedora-kickstart.ks          - Kickstart configuration
fedora-isolinux.cfg          - BIOS boot config
fedora-grub.cfg              - UEFI boot config
fedora-usb-creator.bat       - Windows automation
Fedora-README.md             - Fedora guide
```

### Ubuntu 24.04 LTS Files (⭐ Recommended)
```
ubuntu2404-user-data         - Autoinstall config
ubuntu2404-meta-data         - Metadata file
ubuntu2404-grub.cfg          - UEFI boot config
ubuntu2404-usb-creator.bat   - Windows automation
```

### Ubuntu 22.04 LTS Files
```
ubuntu-user-data             - Autoinstall config
ubuntu-meta-data             - Metadata file
ubuntu-grub.cfg              - UEFI boot config
ubuntu-usb-creator.bat       - Windows automation
Ubuntu-README.md             - Ubuntu 22.04 guide
```

### Ubuntu 20.04 LTS Files (⚠️ Not Recommended)
```
ubuntu2004-user-data         - Autoinstall config
ubuntu2004-meta-data         - Metadata file
ubuntu2004-grub.cfg          - UEFI boot config
ubuntu2004-usb-creator.bat   - Windows automation
```

### Documentation Files
```
Windows-ISO-Creation-Guide.md  - Detailed Windows guide
Ubuntu-All-Versions-Guide.md   - Ubuntu versions comparison
COMPARISON.md                  - Rocky vs RHEL vs Ubuntu
THIS FILE                      - Master index (you are here)
```

## 🔧 Common Configuration (All Distributions)

All configurations share these settings:
- **Language:** English (en_US.UTF-8)
- **Keyboard:** Swiss German (de-ch)
- **Timezone:** Europe/Zurich
- **Network:** DHCP
- **User:** adminlocal
- **Password:** Passwort2025*
- **Root:** Disabled
- **Server:** No GUI
- **Firewall:** Disabled
- **Partitions:** /boot/efi 512MB, /boot 2GB, / rest
- **Swap:** None
- **SSH:** Enabled
- **Updates:** Automatic during install

## 🚀 Getting Started

### Step 1: Choose Your Distribution

Use the Quick Selection Guide above to choose.

### Step 2: Download ISO

- **Rocky Linux 9:** https://rockylinux.org/download
- **RHEL 9:** https://access.redhat.com/downloads/ (requires account)
- **Fedora Server:** https://fedoraproject.org/server/download
- **Ubuntu 24.04:** https://ubuntu.com/download/server
- **Ubuntu 22.04:** https://ubuntu.com/download/server
- **Ubuntu 20.04:** https://ubuntu.com/download/server (not recommended)

### Step 3: Follow the Guide

**For Rocky Linux or RHEL:**
1. Read `Windows-ISO-Creation-Guide.md` or `README.md`
2. Use `build-iso.bat` for automation
3. Or manually create USB with Rufus

**For Fedora Server:**
1. Read `Fedora-README.md`
2. Use `fedora-usb-creator.bat` for automation
3. Or manually create USB with Rufus
4. Remember: Short support cycle (13 months)

**For Ubuntu 24.04 (Recommended):**
1. Read `Ubuntu-All-Versions-Guide.md`
2. Use `ubuntu2404-usb-creator.bat` for automation
3. Or manually create USB with Rufus

**For Ubuntu 22.04:**
1. Read `Ubuntu-README.md` or `Ubuntu-All-Versions-Guide.md`
2. Use `ubuntu-usb-creator.bat` for automation
3. Or manually create USB with Rufus

**For Ubuntu 20.04 (Not Recommended):**
1. Consider using 24.04 or 22.04 instead
2. If you must: use `ubuntu2004-usb-creator.bat`

## 📊 Comparison Matrix

| Feature | Rocky 9 | RHEL 9 | Fedora | Ubuntu 24.04 | Ubuntu 22.04 | Ubuntu 20.04 |
|---------|---------|--------|--------|--------------|--------------|--------------|
| **Cost** | Free | Paid | Free | Free | Free | Free |
| **Support Until** | ~2032 | 2034+ | ~13mo ⚠️ | 2029 | 2027 | 2025 ⚠️ |
| **Config Type** | Kickstart | Kickstart | Kickstart | Autoinstall | Autoinstall | Autoinstall |
| **Package Mgr** | dnf | dnf | dnf | apt | apt | apt |
| **Firewall** | firewalld | firewalld | firewalld | ufw | ufw | ufw |
| **Default FS** | xfs | xfs | xfs | ext4 | ext4 | ext4 |
| **Kernel** | 5.14 | 5.14 | 6.11 | 6.8 | 5.15 | 5.4 |
| **RHEL Compatible** | Yes | Yes | Upstream | No | No | No |
| **Recommendation** | ✅ Good | ✅ Enterprise | ⚠️ Dev Only | ⭐ Best | ✅ Good | ⚠️ Avoid |

## 🛠️ Tools Required (Windows)

All methods require:
1. **Rufus** - https://rufus.ie/ (USB creation)
2. **7-Zip** - https://www.7-zip.org/ (ISO extraction)

For custom ISO creation (optional):
3. **ImgBurn** - https://www.imgburn.com/ (ISO creation)

## 📖 Documentation Guide

**Start here:**
- `THIS FILE` - Overview and quick start

**For detailed instructions:**
- `Windows-ISO-Creation-Guide.md` - Rocky/RHEL step-by-step
- `Ubuntu-All-Versions-Guide.md` - All Ubuntu versions
- `Ubuntu-README.md` - Ubuntu 22.04 specific

**For comparison and decision making:**
- `COMPARISON.md` - Detailed comparison Rocky vs RHEL vs Ubuntu

**For specific systems:**
- `README.md` - Rocky Linux details
- `RHEL9-README.md` - RHEL 9 details

## ⚡ Quick Start Commands

### After Installation - All Systems

**Login:**
```bash
Username: adminlocal
Password: Passwort2025*
```

**Verify Installation:**
```bash
# Check system info
hostnamectl

# Check disk layout
df -h

# Check network
ip addr

# Check SSH
systemctl status ssh
# or (RHEL/Rocky)
systemctl status sshd
```

**Update System:**
```bash
# Ubuntu
sudo apt update && sudo apt upgrade -y

# Rocky/RHEL
sudo dnf update -y
```

**Optional - Enable Firewall:**
```bash
# Ubuntu
sudo ufw enable
sudo ufw allow ssh

# Rocky/RHEL
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

## 🔒 Security Considerations

All configurations:
- ✅ Root account disabled
- ✅ Regular user with sudo access
- ✅ SSH enabled (password authentication)
- ⚠️ Firewall disabled by default (enable after install)
- ✅ SELinux/AppArmor enforcing
- ✅ Automatic security updates during install

**Post-Installation Security Hardening:**
1. Enable firewall
2. Configure SSH key authentication
3. Disable password SSH login
4. Set up fail2ban
5. Configure automatic security updates

## 🆘 Troubleshooting

**Installation doesn't start:**
- Verify boot order in BIOS
- Check secure boot settings
- Verify ISO/USB integrity

**Autoinstall not found (Ubuntu):**
- Check /autoinstall/ folder exists
- Verify files named user-data and meta-data (no extensions)
- Verify grub.cfg has autoinstall parameter

**Kickstart not found (Rocky/RHEL):**
- Verify .ks file on USB root
- Check file name matches boot parameter
- Verify USB label matches boot config

**Disk partitioning fails:**
- Check disk is detected
- Verify ignoredisk parameter matches your disk (sda, nvme0n1, vda)
- For HDD, remove ssd: true line

**Network issues:**
- Verify DHCP available
- Check network cable connected
- Try static IP configuration

## 📞 Support Resources

**Rocky Linux:**
- https://docs.rockylinux.org/
- https://forums.rockylinux.org/

**RHEL:**
- https://access.redhat.com/
- https://access.redhat.com/documentation/

**Ubuntu:**
- https://ubuntu.com/server/docs
- https://askubuntu.com/
- https://ubuntuforums.org/

## ✅ Testing Checklist

Before deploying to production:

1. ☐ Test in virtual machine first
2. ☐ Verify automated installation completes
3. ☐ Test login with adminlocal
4. ☐ Verify sudo access works
5. ☐ Check network configuration
6. ☐ Verify SSH access
7. ☐ Test system updates
8. ☐ Verify disk partitioning
9. ☐ Check timezone and keyboard
10. ☐ Document any issues

## 🎓 Learning Path

**New to Linux?** Start with:
1. Ubuntu 24.04 (easiest to use)
2. Practice in virtual machine
3. Learn basic Linux commands
4. Understand package management

**Coming from CentOS?**
1. Rocky Linux 9 (direct replacement)
2. Same commands and tools
3. Familiar environment

**Enterprise Environment?**
1. Test with Rocky Linux 9
2. Evaluate RHEL 9 if you need support
3. Consider Ubuntu for modern workloads

## 📝 Customization

To modify configurations:

**Change Password:**
```bash
# Generate new hash
python3 -c 'import crypt; print(crypt.crypt("YourNewPassword", crypt.mksalt(crypt.METHOD_SHA512)))'
# Replace password hash in config files
```

**Change Username:**
- Edit all references to "adminlocal"
- Update in identity/user sections

**Change Partitions:**
- Modify storage/partition sections
- Adjust sizes as needed

**Add Packages:**
- Add to packages list in configs

**Change Timezone:**
- Modify timezone: line

## 🌟 Best Practices

1. **Always test in VM first**
2. **Document your configuration**
3. **Keep backups of config files**
4. **Use version control for customizations**
5. **Test recovery procedures**
6. **Enable automatic security updates**
7. **Set up monitoring**
8. **Plan for upgrades**
9. **Document passwords securely**
10. **Review security settings post-install**

## 📅 Maintenance Schedule

**Monthly:**
- Apply security updates
- Review system logs
- Check disk space

**Quarterly:**
- Full system updates
- Review user access
- Update documentation

**Annually:**
- Plan for LTS upgrades
- Review backup strategy
- Security audit

## 🎉 Ready to Install!

You now have everything needed for automated Linux installations!

**Next Steps:**
1. Choose your distribution from Quick Selection Guide
2. Download the ISO
3. Run the appropriate batch script
4. Boot and watch it install automatically
5. Enjoy your new system!

**Questions?** Check the specific README files for each distribution.

**Good luck with your installation! 🚀**
