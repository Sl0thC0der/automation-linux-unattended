# Ubuntu 20.04 LTS - Unattended Installation Files

This folder contains all files needed for automated Ubuntu 20.04 LTS Server installation.

## ⚠️ WARNING: Support Ending Soon!

**Ubuntu 20.04 LTS standard support ends April 2025 - Only 6 months away!**

### ❌ Not Recommended for New Installations

- ⚠️ Support ends in 6 months (April 2025)
- ⚠️ Old kernel (5.4) - limited hardware support
- ⚠️ Older packages
- ⚠️ Should upgrade to 22.04 or 24.04

### ✅ Recommended Alternatives

- **Ubuntu 24.04 LTS** - Supported until 2029
- **Ubuntu 22.04 LTS** - Supported until 2027
- **Rocky Linux 9** - Supported until 2032

**This folder is provided ONLY for:**
- Matching existing 20.04 infrastructure
- Legacy application requirements
- Testing migration paths

## 📁 Files in This Folder

- **ubuntu2004-user-data** - Autoinstall configuration (cloud-init YAML)
- **ubuntu2004-meta-data** - Metadata file (required)
- **ubuntu2004-grub.cfg** - UEFI boot configuration (auto-start enabled)
- **ubuntu2004-usb-creator.bat** - Windows automation script

## 🎯 Quick Start (If You Must Use 20.04)

### Using the Automation Script

1. **Download Ubuntu 20.04 LTS ISO:**
   - https://ubuntu.com/download/server
   - Select "Ubuntu 20.04 LTS"

2. **Run the script:**
   - Double-click `ubuntu2004-usb-creator.bat`
   - Script will warn you about EOL
   - Follow prompts if you proceed

### Manual Method

Same as other Ubuntu versions:
1. Create bootable USB with Rufus
2. Create `autoinstall` folder
3. Copy and rename files to `user-data` and `meta-data`
4. Modify grub.cfg

## ⚙️ Configuration Details

Same as other versions:
- **Language:** English
- **Keyboard:** Swiss German
- **Timezone:** Europe/Zurich
- **User:** adminlocal / Passwort2025*
- **Partitions:** /boot/efi 512MB, /boot 2GB, / rest
- **No swap**

## 📋 System Specifications

- **Distribution:** Ubuntu 20.04 LTS (Focal Fossa)
- **Release Date:** April 2020
- **Standard Support:** Until April 2025 ⚠️ (6 months!)
- **Extended Support:** Until 2030 (Ubuntu Pro only)
- **Kernel:** 5.4 (old)
- **Python:** 3.8 (old)
- **Status:** End of Life approaching

## ⚠️ Critical Timeline

```
Standard Support ████████████████░░  (Ends April 2025!)
Extended Support ████████████████████████  (Until 2030 with Pro)
```

**You have 6 months to plan migration!**

## 🔄 Migration Path (Recommended)

### Option 1: Upgrade to 22.04 or 24.04

```bash
# Update current system
sudo apt update
sudo apt upgrade -y

# Upgrade to 22.04
sudo do-release-upgrade

# Then optionally upgrade to 24.04
sudo do-release-upgrade
```

### Option 2: Fresh Install

**Recommended for production:**
1. Deploy new server with Ubuntu 24.04
2. Migrate applications
3. Test thoroughly
4. Switch over
5. Decommission 20.04 server

### Option 3: Extended Support

```bash
# Get Ubuntu Pro (free for 5 machines)
# Register at: https://ubuntu.com/pro
sudo pro attach YOUR_TOKEN

# Extends support until 2030
# But still on old kernel and packages
```

## 📚 Additional Documentation

- `../documentation/Ubuntu-All-Versions-Guide.md` - All versions
- `../MASTER-INDEX.md` - Overview

## 💡 Why You Shouldn't Use 20.04

### ❌ Reasons to Avoid

1. **Support Ending:** April 2025 (6 months!)
2. **Old Kernel:** 5.4 - poor new hardware support
3. **Old Packages:** Security patches only, no features
4. **Python 3.8:** Outdated for modern development
5. **Technical Debt:** Building on obsolete base

### ✅ Better Alternatives

**For new installations:**
- **Ubuntu 24.04 LTS:** Latest, supported until 2029
- **Ubuntu 22.04 LTS:** Proven, supported until 2027
- **Rocky Linux 9:** RHEL-compatible, supported until 2032

**All have the same configuration as this 20.04 package!**

## 📊 Comparison: Why Upgrade Now

| Feature | Ubuntu 20.04 | Ubuntu 22.04 | Ubuntu 24.04 |
|---------|--------------|--------------|--------------|
| Support Until | 2025 ⚠️ | 2027 | 2029 |
| Kernel | 5.4 ⚠️ | 5.15 | 6.8 |
| Python | 3.8 ⚠️ | 3.10 | 3.12 |
| Hardware Support | Limited ⚠️ | Good | Excellent |
| Package Updates | Security only ⚠️ | Full | Full |
| Production Ready | ⚠️ Expiring | ✅ Yes | ✅ Yes |

## 🚨 Migration Urgency

**If you have production 20.04 systems:**

### Immediate (Within 1-2 months):
- [ ] Inventory all 20.04 systems
- [ ] Test applications on 22.04/24.04
- [ ] Plan migration timeline
- [ ] Backup everything

### Short-term (Within 3-4 months):
- [ ] Migrate non-critical systems
- [ ] Document any issues
- [ ] Adjust procedures
- [ ] Train team

### Before April 2025:
- [ ] All production systems migrated
- [ ] Ubuntu Pro for any remaining systems
- [ ] Decommission old infrastructure

## 📞 Support Resources

- Ubuntu Server Guide: https://ubuntu.com/server/docs
- Migration Guide: https://ubuntu.com/blog/how-to-upgrade-from-ubuntu-20-04-lts-to-22-04-lts
- Ubuntu Pro: https://ubuntu.com/pro

## 🆘 If You Must Use 20.04

**Only acceptable if:**
- Matching existing short-term infrastructure
- Legacy application requires it
- Planning immediate migration
- Using Ubuntu Pro for extended support

**Not acceptable if:**
- New installation (use 24.04 instead)
- Long-term deployment (use 22.04 or 24.04)
- Modern hardware (use 24.04)
- No migration plan

## ✅ What To Do Instead

1. **Stop:** Don't install 20.04
2. **Choose:** Ubuntu 24.04 LTS or Ubuntu 22.04 LTS
3. **Use:** The same configuration files work!
4. **Enjoy:** 5+ more years of support

**All configurations in this package use identical settings. Just use the 24.04 or 22.04 folder instead!**

---

**⚠️ FINAL WARNING: Do not use Ubuntu 20.04 for new installations!**

**Use Ubuntu 24.04 LTS or Ubuntu 22.04 LTS instead - they have the exact same configuration!**

**Support ends April 2025 - Upgrade now! ⏰**
