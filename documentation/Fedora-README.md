# Fedora Server Unattended Installation Package

This package contains everything you need for a fully automated Fedora Server installation.

## Files for Fedora Server

1. **fedora-kickstart.ks** - Kickstart configuration
2. **fedora-isolinux.cfg** - Pre-configured BIOS boot configuration
3. **fedora-grub.cfg** - Pre-configured UEFI boot configuration
4. **Fedora-README.md** - This file

## Important: Understanding Fedora

**Fedora is different from RHEL/Rocky Linux:**

### Key Characteristics
- 🚀 **Cutting-edge:** Latest packages and technologies
- ⚡ **Fast releases:** New version every ~6 months
- 📅 **Short lifecycle:** ~13 months support per version
- 🔬 **Upstream:** Technology preview for future RHEL
- 🆓 **Free:** No subscription required
- 🎯 **Purpose:** Development, testing, early adoption

### Version Lifecycle

**Current Fedora Versions (as of October 2025):**
- **Fedora 41** - Released Oct 2024, EOL ~Nov 2025
- **Fedora 40** - Released Apr 2024, EOL ~May 2025
- **Fedora 42** - Expected Apr 2025

**Support Timeline:**
```
Fedora 40  ████████████░░░░░░░░░  (EOL May 2025)
Fedora 41  ░░░░░░░░████████████  (EOL Nov 2025)
Fedora 42           ░░░░░░░░████████████  (Expected Apr 2025)
```

### Fedora vs RHEL/Rocky vs Ubuntu

| Feature | Fedora | Rocky/RHEL | Ubuntu LTS |
|---------|--------|------------|------------|
| **Release Cycle** | 6 months | ~3 years | 2 years |
| **Support Length** | 13 months | 10 years | 5 years |
| **Packages** | Latest | Stable | Stable |
| **Purpose** | Bleeding edge | Enterprise | General use |
| **Risk Level** | Higher | Lower | Lower |
| **Cost** | Free | Free/Paid | Free |

## Installation Configuration

Same as all other configurations in this package:
- **Language:** English
- **Keyboard:** Swiss German (de-ch)
- **Timezone:** Europe/Zurich
- **Network:** DHCP
- **Root:** Disabled
- **User:** adminlocal / Passwort2025*
- **Installation:** Server (no GUI)
- **Firewall:** Disabled
- **Partitions:** /boot/efi 512MB, /boot 2GB, / rest (xfs)
- **No swap**
- **SSH enabled**
- **Auto-updates during install**

## Quick Start Methods

### Method 1: Simple USB (Recommended)

1. **Create bootable USB with Rufus:**
   - Use Fedora Server ISO
   - Choose DD Image mode

2. **Add Kickstart file:**
   - Copy `fedora-kickstart.ks` to USB root

3. **Boot and add parameter once:**
   - Press Tab (BIOS) or E (UEFI) at boot
   - Add: `inst.ks=hd:LABEL=Fedora-S-dvd-x86_64-41:/fedora-kickstart.ks`
   - **Note:** Replace `41` with your Fedora version number
   - Press Enter

### Method 2: Custom ISO (Fully Automated)

Follow the same process as Rocky Linux:

1. **Extract Fedora Server ISO** with 7-Zip

2. **Copy files:**
   - `fedora-kickstart.ks` to root
   - `fedora-isolinux.cfg` to `isolinux/isolinux.cfg`
   - `fedora-grub.cfg` to `EFI/BOOT/grub.cfg`

3. **Update ISO labels:**
   - Check your ISO label: Right-click ISO → Properties
   - Common labels: `Fedora-S-dvd-x86_64-41`, `Fedora-S-dvd-x86_64-40`
   - Update LABEL= in isolinux.cfg and grub.cfg to match

4. **Create ISO with ImgBurn**

5. **Write to USB with Rufus**

## ISO Label Reference

**Finding your ISO label:**
```bash
# On Linux
isoinfo -d -i fedora.iso | grep "Volume id"

# On Windows
Right-click ISO → Properties → Volume label
```

**Common Fedora ISO labels:**
- Fedora 41: `Fedora-S-dvd-x86_64-41`
- Fedora 40: `Fedora-S-dvd-x86_64-40`
- Fedora 39: `Fedora-S-dvd-x86_64-39`

**Update in config files:**
Replace all instances of `Fedora-S-dvd-x86_64-41` with your actual label.

## Getting Fedora Server

**Download from:** https://fedoraproject.org/server/download

**Choose the right version:**
- 🔴 **Latest (Fedora 41)** - Most features, newest packages
- 🟡 **Previous (Fedora 40)** - More tested, less bleeding edge
- 🔵 **Avoid older** - Limited support remaining

**Editions:**
- Server (recommended for this config)
- Workstation (desktop)
- IoT, CoreOS, Silverblue (specialized)

## When to Use Fedora

### ✅ Good Use Cases

**Development:**
- Testing latest technologies
- Development environments
- CI/CD systems
- Container development

**Learning:**
- Learning newest Linux features
- Experimenting with cutting-edge tech
- RHEL feature preview
- Personal projects

**Early Adoption:**
- Need latest software versions
- Want newest kernel features
- Testing future RHEL features
- Contributing to open source

### ❌ NOT Recommended For

**Production Critical Systems:**
- ❌ Production databases
- ❌ Financial systems
- ❌ Critical infrastructure
- ❌ Long-term stable deployments

**Reasons:**
- Short support lifecycle (13 months)
- Frequent mandatory upgrades
- Potential breaking changes
- Less tested than LTS distros

**Use Rocky/RHEL or Ubuntu LTS instead for production**

## Fedora → RHEL Technology Pipeline

Fedora is the upstream for RHEL:

```
Fedora 34-35 → RHEL 9.0 (2022)
Fedora 36-37 → RHEL 9.1 (2022)
Fedora 38-39 → RHEL 9.2 (2023)
Fedora 40-41 → RHEL 9.3+ (2024+)
```

**What this means:**
- Technologies tested in Fedora
- Mature features move to RHEL
- Fedora = preview of future RHEL

## Upgrade Path

**Fedora requires regular upgrades:**

### Every ~6 Months
```bash
# Update current system
sudo dnf update -y

# Upgrade to next Fedora version
sudo dnf system-upgrade download --releasever=42
sudo dnf system-upgrade reboot
```

### Automation
Consider:
- Scheduled maintenance windows
- Testing upgrades in staging
- Backup before upgrades
- Skip releases not recommended

### Alternative: Fresh Install
Many admins prefer:
- Fresh install every 12-18 months
- Configuration management (Ansible, Puppet)
- Containers for applications
- Immutable infrastructure

## Package Management

Same as Rocky/RHEL:

```bash
# Search packages
dnf search package-name

# Install package
sudo dnf install package-name

# Update system
sudo dnf update

# Remove package
sudo dnf remove package-name

# List installed
dnf list installed
```

## Post-Installation Steps

### 1. Verify Installation
```bash
# Check Fedora version
cat /etc/fedora-release

# Check kernel version
uname -r

# Check timezone
timedatectl

# Check network
ip addr

# Check SSH
systemctl status sshd
```

### 2. Optional - Enable Firewall
```bash
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

### 3. Set Up Automatic Updates
```bash
# Install dnf-automatic
sudo dnf install -y dnf-automatic

# Enable automatic updates
sudo systemctl enable --now dnf-automatic.timer

# Configure update policy
sudo nano /etc/dnf/automatic.conf
# Set: apply_updates = yes
```

### 4. Configure System

**Enable additional repos:**
```bash
# RPM Fusion (for additional software)
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# EPEL-like additional packages already available
```

## Latest Features in Fedora

### Fedora 41 (Current)
- Kernel 6.11
- systemd 256
- GNOME 47 (not in Server)
- Python 3.13
- GCC 14
- Better ARM support

### Fedora 40
- Kernel 6.8
- systemd 255
- Python 3.12
- Improved Wayland support
- Enhanced security features

## Comparison with Your Other Options

### Choose Fedora if:
- ✅ Development/testing environment
- ✅ Want latest software versions
- ✅ Learning/experimentation
- ✅ Can handle frequent upgrades
- ✅ Need cutting-edge features

### Choose Rocky Linux 9 if:
- ✅ Production environment
- ✅ Need stability over features
- ✅ Want 10-year support
- ✅ RHEL compatibility required
- ✅ Minimal administration overhead

### Choose Ubuntu 24.04 LTS if:
- ✅ Production environment
- ✅ Prefer Debian-based systems
- ✅ Want long support (5+ years)
- ✅ Need wide software availability
- ✅ Cloud deployments

## Container Usage with Fedora

**Fedora excels as a container host:**

```bash
# Podman (built-in)
sudo dnf install -y podman

# Docker
sudo dnf install -y docker
sudo systemctl enable --now docker

# Kubernetes
sudo dnf install -y kubernetes

# Development containers
toolbox create fedora-dev
```

## Security Features

Same as Rocky/RHEL:
- ✅ SELinux enforcing
- ✅ Firewalld available
- ✅ Secure boot support
- ✅ Regular security updates
- ✅ AppArmor alternative available

## Troubleshooting

**ISO label mismatch:**
- Check actual USB label
- Update both isolinux.cfg and grub.cfg
- Common format: `Fedora-S-dvd-x86_64-XX`

**Installation source not found:**
- Verify kickstart filename: `fedora-kickstart.ks`
- Try: `inst.ks=hd:sdb1:/fedora-kickstart.ks`
- Check USB is mounted

**Package conflicts:**
- Fedora moves fast, package names may change
- Check Fedora documentation for current names
- Remove problematic packages from kickstart

**Hardware compatibility:**
- Latest Fedora = best new hardware support
- Older hardware usually works fine
- Check Fedora hardware compatibility list

## Migration Strategies

### From Fedora to Rocky Linux
**When your Fedora project matures:**

1. **Clean migration:**
   - Deploy Rocky Linux with same config
   - Migrate applications
   - Test thoroughly
   - Switch over

2. **Why migrate:**
   - Project enters production
   - Need long-term stability
   - Reduce upgrade frequency
   - Vendor support required

3. **Timeline:**
   - Plan migration before Fedora EOL
   - Allow 2-3 months for testing
   - Document differences

### Staying on Fedora Long-term

**If you stay on Fedora:**
- ✅ Automate upgrades
- ✅ Use configuration management
- ✅ Containerize applications
- ✅ Regular testing environment
- ✅ Backup strategy
- ✅ Monitoring and alerting

## Support Resources

**Official:**
- Fedora Project: https://fedoraproject.org/
- Documentation: https://docs.fedoraproject.org/
- Wiki: https://fedoraproject.org/wiki/
- Magazine: https://fedoramagazine.org/

**Community:**
- Fedora Discussion: https://discussion.fedoraproject.org/
- IRC: #fedora on Libera.Chat
- Reddit: r/Fedora
- Matrix: #fedora:fedoraproject.org

**Development:**
- Bugzilla: https://bugzilla.redhat.com/
- GitLab: https://gitlab.com/fedora/
- Package maintenance: https://src.fedoraproject.org/

## Advantages of Fedora

### ✅ Pros
- Latest software and technologies
- Fast kernel updates
- Great hardware support
- Strong Red Hat backing
- Excellent for development
- Free and open source
- Active community
- Regular predictable releases

### ⚠️ Cons
- Short support lifecycle
- Frequent upgrades required
- Potential instability
- Not for production critical
- Less enterprise tooling
- Breaking changes possible

## Best Practices for Fedora

1. **Plan upgrade schedule**
   - Calendar 6-month cycles
   - Test upgrades in staging
   - Backup before upgrading

2. **Use containers**
   - Isolate applications
   - Easier to manage
   - Version independence

3. **Configuration management**
   - Ansible, Puppet, Salt
   - Document everything
   - Version control configs

4. **Monitor lifecycle**
   - Track EOL dates
   - Subscribe to announcements
   - Plan migrations early

5. **Testing**
   - Always test in VM first
   - Validate applications work
   - Check for deprecations

## Summary

**Fedora Server is ideal for:**
- 🎓 Learning and development
- 🔬 Testing new technologies
- 🚀 Early feature adoption
- 🛠️ Non-critical infrastructure
- 🔄 Environments with regular maintenance windows

**Not suitable for:**
- 🏢 Production critical systems
- 💰 Systems requiring long-term stability
- 📊 Enterprise environments needing extended support
- 🔒 Regulated industries

**For production, use:**
- Rocky Linux 9 (RHEL-compatible, 10-year support)
- RHEL 9 (commercial support, certifications)
- Ubuntu 22.04/24.04 LTS (long-term stable)

## Quick Comparison

| Need | Recommended |
|------|-------------|
| Latest features | ⭐ Fedora 41 |
| Production stable | Rocky Linux 9 |
| Enterprise support | RHEL 9 |
| Long-term stable | Ubuntu 24.04 LTS |
| Development | Fedora 41 |
| Learning | Fedora 41 or Ubuntu 24.04 |

**Bottom Line:**
Fedora is excellent for development, testing, and learning, but requires commitment to regular upgrades. For production systems, choose Rocky Linux 9 or Ubuntu LTS instead.
