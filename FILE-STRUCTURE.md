# File Structure Guide

This document provides a complete overview of the file organization for the Linux Unattended Installation package.

---

## 📂 Complete Directory Tree

```
Linux-Unattended-Installation/
│
├── README.md                          Main overview and quick start
├── MASTER-INDEX.md                    Complete documentation index
│
├── rocky-linux-9/                     Rocky Linux 9 files
│   ├── README.md                      Rocky-specific guide
│   ├── rocky-kickstart.ks             Kickstart configuration
│   ├── isolinux.cfg                   BIOS boot config (auto-start)
│   ├── grub.cfg                       UEFI boot config (auto-start)
│   └── build-iso.bat                  Windows automation script
│
├── rhel-9/                            RHEL 9 files
│   ├── README.md                      RHEL-specific guide
│   ├── rhel9-kickstart.ks             Kickstart configuration
│   ├── rhel9-isolinux.cfg             BIOS boot config (auto-start)
│   └── rhel9-grub.cfg                 UEFI boot config (auto-start)
│
├── fedora-server/                     Fedora Server files
│   ├── README.md                      Fedora-specific guide
│   ├── fedora-kickstart.ks            Kickstart configuration
│   ├── fedora-isolinux.cfg            BIOS boot config (auto-start)
│   ├── fedora-grub.cfg                UEFI boot config (auto-start)
│   └── fedora-usb-creator.bat         Windows automation script
│
├── ubuntu-24.04-lts/                  Ubuntu 24.04 LTS files ⭐
│   ├── README.md                      Ubuntu 24.04 guide
│   ├── ubuntu2404-user-data           Autoinstall config (YAML)
│   ├── ubuntu2404-meta-data           Metadata file
│   ├── ubuntu2404-grub.cfg            UEFI boot config (auto-start)
│   └── ubuntu2404-usb-creator.bat     Windows automation script
│
├── ubuntu-22.04-lts/                  Ubuntu 22.04 LTS files
│   ├── README.md                      Ubuntu 22.04 guide
│   ├── ubuntu-user-data               Autoinstall config (YAML)
│   ├── ubuntu-meta-data               Metadata file
│   ├── ubuntu-grub.cfg                UEFI boot config (auto-start)
│   └── ubuntu-usb-creator.bat         Windows automation script
│
├── ubuntu-20.04-lts/                  Ubuntu 20.04 LTS files ⚠️
│   ├── README.md                      Ubuntu 20.04 guide (with warnings)
│   ├── ubuntu2004-user-data           Autoinstall config (YAML)
│   ├── ubuntu2004-meta-data           Metadata file
│   ├── ubuntu2004-grub.cfg            UEFI boot config (auto-start)
│   └── ubuntu2004-usb-creator.bat     Windows automation script
│
└── documentation/                     Additional documentation
    ├── Windows-ISO-Creation-Guide.md  Detailed Windows guide (RHEL-based)
    ├── Ubuntu-All-Versions-Guide.md   All Ubuntu versions comparison
    ├── COMPARISON.md                  Distribution comparison
    ├── Fedora-README.md               Extended Fedora guide
    ├── RHEL9-README.md                Extended RHEL guide
    └── Ubuntu-README.md               Extended Ubuntu 22.04 guide
```

---

## 📁 Directory Descriptions

### Root Level

**README.md**
- Main entry point
- Quick selection guide
- Overview of all distributions
- Quick start instructions
- Common configuration details

**MASTER-INDEX.md**
- Complete documentation index
- All distributions overview
- Detailed comparison matrix
- Step-by-step guides
- Troubleshooting section

### Distribution Folders

Each distribution folder contains:

1. **README.md** - Distribution-specific guide with:
   - Quick start instructions
   - Configuration details
   - System specifications
   - Best use cases
   - Post-installation steps
   - Troubleshooting

2. **Configuration files** - Installation automation:
   - Kickstart (.ks) or Autoinstall (user-data/meta-data)
   - Boot configuration files
   - Automation scripts

### Documentation Folder

Additional reference documentation:
- Detailed guides for specific topics
- Extended documentation
- Comparison documents
- Advanced configuration guides

---

## 📋 File Types Explained

### Kickstart Files (.ks)

**Used by:** Rocky Linux, RHEL, Fedora

**Purpose:** Automated installation configuration

**Format:** Text-based, similar to bash scripts

**Key sections:**
- System settings (language, keyboard, timezone)
- Network configuration
- User accounts
- Partitioning
- Package selection
- Post-installation scripts

**Examples:**
- `rocky-kickstart.ks`
- `rhel9-kickstart.ks`
- `fedora-kickstart.ks`

### Autoinstall Files (user-data/meta-data)

**Used by:** Ubuntu 20.04, 22.04, 24.04

**Purpose:** Automated installation configuration

**Format:** YAML (cloud-init format)

**Key files:**
- `user-data` - Main configuration (system settings, users, packages)
- `meta-data` - Metadata (instance ID)

**Must be in /autoinstall/ folder on USB**

**Examples:**
- `ubuntu2404-user-data` / `ubuntu2404-meta-data`
- `ubuntu-user-data` / `ubuntu-meta-data`
- `ubuntu2004-user-data` / `ubuntu2004-meta-data`

### Boot Configuration Files

**isolinux.cfg**
- BIOS boot configuration
- Used by Legacy BIOS systems
- Configures boot menu and kernel parameters
- Auto-start with 1-10 second timeout

**grub.cfg**
- UEFI boot configuration
- Used by modern UEFI systems
- Configures GRUB2 boot menu
- Auto-start with 1 second timeout

### Automation Scripts (.bat)

**Purpose:** Windows automation tools

**What they do:**
- Extract ISO files
- Copy configuration files
- Modify boot configurations
- Create custom ISO (some)
- Prepare USB drives

**Examples:**
- `build-iso.bat` (Rocky Linux)
- `fedora-usb-creator.bat` (Fedora)
- `ubuntu2404-usb-creator.bat` (Ubuntu 24.04)

---

## 🗂️ File Naming Conventions

### Rocky Linux 9
- **Prefix:** `rocky-` or none (original files)
- **Example:** `rocky-kickstart.ks`, `isolinux.cfg`

### RHEL 9
- **Prefix:** `rhel9-`
- **Example:** `rhel9-kickstart.ks`, `rhel9-grub.cfg`

### Fedora Server
- **Prefix:** `fedora-`
- **Example:** `fedora-kickstart.ks`, `fedora-grub.cfg`

### Ubuntu 24.04 LTS
- **Prefix:** `ubuntu2404-`
- **Example:** `ubuntu2404-user-data`, `ubuntu2404-grub.cfg`
- **Note:** Remove prefix when copying to USB (→ `user-data`, `meta-data`)

### Ubuntu 22.04 LTS
- **Prefix:** `ubuntu-` (default)
- **Example:** `ubuntu-user-data`, `ubuntu-grub.cfg`
- **Note:** Remove prefix when copying to USB

### Ubuntu 20.04 LTS
- **Prefix:** `ubuntu2004-`
- **Example:** `ubuntu2004-user-data`, `ubuntu2004-grub.cfg`
- **Note:** Remove prefix when copying to USB

---

## 📊 File Count Summary

| Category | Count | Purpose |
|----------|-------|---------|
| **README Files** | 9 | Documentation and guides |
| **Kickstart Files** | 3 | Rocky, RHEL, Fedora configs |
| **Autoinstall Files** | 6 | Ubuntu user-data + meta-data |
| **Boot Configs** | 9 | BIOS and UEFI boot files |
| **Automation Scripts** | 5 | Windows helper scripts |
| **Documentation** | 6 | Extended guides |
| **TOTAL** | 38 | Complete package |

---

## 🎯 How to Navigate

### For New Users

1. **Start:** Read `README.md` at root
2. **Learn:** Read `MASTER-INDEX.md` for overview
3. **Choose:** Pick a distribution folder
4. **Read:** Distribution's README.md
5. **Use:** Follow the instructions in that README

### For Experienced Users

1. **Navigate:** Go directly to distribution folder
2. **Use:** Grab the files you need
3. **Customize:** Edit configuration files if needed
4. **Deploy:** Create installation media

### For Troubleshooting

1. **Check:** Distribution-specific README.md
2. **Review:** `documentation/Windows-ISO-Creation-Guide.md`
3. **Compare:** `documentation/COMPARISON.md`
4. **Reference:** `MASTER-INDEX.md`

---

## 📦 Distribution Folder Details

### Rocky Linux 9 Folder
```
rocky-linux-9/
├── README.md              3.5 KB | Rocky-specific guide
├── rocky-kickstart.ks     2.0 KB | Main configuration
├── isolinux.cfg           512 B  | BIOS boot config
├── grub.cfg               1.5 KB | UEFI boot config
└── build-iso.bat          3.5 KB | Windows automation
```

### RHEL 9 Folder
```
rhel-9/
├── README.md              4.5 KB | RHEL-specific guide
├── rhel9-kickstart.ks     2.0 KB | Main configuration
├── rhel9-isolinux.cfg     512 B  | BIOS boot config
└── rhel9-grub.cfg         1.5 KB | UEFI boot config
```

### Fedora Server Folder
```
fedora-server/
├── README.md              6.0 KB | Fedora-specific guide
├── fedora-kickstart.ks    2.0 KB | Main configuration
├── fedora-isolinux.cfg    512 B  | BIOS boot config
├── fedora-grub.cfg        1.5 KB | UEFI boot config
└── fedora-usb-creator.bat 6.0 KB | Windows automation
```

### Ubuntu 24.04 LTS Folder
```
ubuntu-24.04-lts/
├── README.md              5.5 KB | Ubuntu 24.04 guide
├── ubuntu2404-user-data   3.0 KB | Autoinstall config
├── ubuntu2404-meta-data   512 B  | Metadata
├── ubuntu2404-grub.cfg    1.0 KB | UEFI boot config
└── ubuntu2404-usb-creator.bat  5.0 KB | Windows automation
```

### Ubuntu 22.04 LTS Folder
```
ubuntu-22.04-lts/
├── README.md              4.5 KB | Ubuntu 22.04 guide
├── ubuntu-user-data       3.0 KB | Autoinstall config
├── ubuntu-meta-data       512 B  | Metadata
├── ubuntu-grub.cfg        1.0 KB | UEFI boot config
└── ubuntu-usb-creator.bat 5.5 KB | Windows automation
```

### Ubuntu 20.04 LTS Folder
```
ubuntu-20.04-lts/
├── README.md              5.0 KB | Ubuntu 20.04 guide (warnings)
├── ubuntu2004-user-data   3.0 KB | Autoinstall config
├── ubuntu2004-meta-data   512 B  | Metadata
├── ubuntu2004-grub.cfg    1.0 KB | UEFI boot config
└── ubuntu2004-usb-creator.bat  5.5 KB | Windows automation
```

### Documentation Folder
```
documentation/
├── Windows-ISO-Creation-Guide.md  5.0 KB | Windows guide
├── Ubuntu-All-Versions-Guide.md   10 KB  | Ubuntu versions
├── COMPARISON.md                  8.0 KB | Distributions
├── Fedora-README.md               13 KB  | Fedora details
├── RHEL9-README.md                4.5 KB | RHEL details
└── Ubuntu-README.md               9.0 KB | Ubuntu 22.04
```

---

## 🔍 Quick File Lookup

Need a specific file? Use this quick reference:

| What You Need | File Location |
|---------------|---------------|
| **Main overview** | `README.md` |
| **Complete docs** | `MASTER-INDEX.md` |
| **Rocky Linux kickstart** | `rocky-linux-9/rocky-kickstart.ks` |
| **RHEL kickstart** | `rhel-9/rhel9-kickstart.ks` |
| **Fedora kickstart** | `fedora-server/fedora-kickstart.ks` |
| **Ubuntu 24.04 autoinstall** | `ubuntu-24.04-lts/ubuntu2404-user-data` |
| **Ubuntu 22.04 autoinstall** | `ubuntu-22.04-lts/ubuntu-user-data` |
| **Ubuntu 20.04 autoinstall** | `ubuntu-20.04-lts/ubuntu2004-user-data` |
| **Windows guide** | `documentation/Windows-ISO-Creation-Guide.md` |
| **Comparison** | `documentation/COMPARISON.md` |

---

## ✅ Verification Checklist

Use this to verify you have all files:

### Root Level
- [ ] README.md
- [ ] MASTER-INDEX.md

### Rocky Linux 9
- [ ] README.md
- [ ] rocky-kickstart.ks
- [ ] isolinux.cfg
- [ ] grub.cfg
- [ ] build-iso.bat

### RHEL 9
- [ ] README.md
- [ ] rhel9-kickstart.ks
- [ ] rhel9-isolinux.cfg
- [ ] rhel9-grub.cfg

### Fedora Server
- [ ] README.md
- [ ] fedora-kickstart.ks
- [ ] fedora-isolinux.cfg
- [ ] fedora-grub.cfg
- [ ] fedora-usb-creator.bat

### Ubuntu 24.04 LTS
- [ ] README.md
- [ ] ubuntu2404-user-data
- [ ] ubuntu2404-meta-data
- [ ] ubuntu2404-grub.cfg
- [ ] ubuntu2404-usb-creator.bat

### Ubuntu 22.04 LTS
- [ ] README.md
- [ ] ubuntu-user-data
- [ ] ubuntu-meta-data
- [ ] ubuntu-grub.cfg
- [ ] ubuntu-usb-creator.bat

### Ubuntu 20.04 LTS
- [ ] README.md
- [ ] ubuntu2004-user-data
- [ ] ubuntu2004-meta-data
- [ ] ubuntu2004-grub.cfg
- [ ] ubuntu2004-usb-creator.bat

### Documentation
- [ ] Windows-ISO-Creation-Guide.md
- [ ] Ubuntu-All-Versions-Guide.md
- [ ] COMPARISON.md
- [ ] Fedora-README.md
- [ ] RHEL9-README.md
- [ ] Ubuntu-README.md

---

## 📝 Notes

### About File Organization

This structure is designed for:
- **Easy navigation** - Find what you need quickly
- **Clear separation** - Each distribution has its own folder
- **Self-documenting** - README in every folder
- **Scalability** - Easy to add more distributions
- **User-friendly** - Logical and intuitive organization

### About File Sizes

Total package size: ~200 KB (documentation only, no ISOs)
- Very lightweight
- Easy to distribute
- Fast to download
- Can be stored anywhere

### About Customization

All configuration files can be edited:
- Use any text editor (Notepad, Notepad++, VS Code)
- Modify settings as needed
- Save and use your custom version
- Keep original as backup

---

**Ready to use the files?** Start with the root README.md! 🚀
