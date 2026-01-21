# Red Hat Enterprise Linux 9 Unattended Installation Package

This package contains everything you need for a fully automated RHEL 9 installation.

## Files for RHEL 9

1. **rhel9-kickstart.ks** - Your customized Kickstart configuration
2. **rhel9-isolinux.cfg** - Pre-configured BIOS boot configuration
3. **rhel9-grub.cfg** - Pre-configured UEFI boot configuration
4. **RHEL9-README.md** - This file

## Important Notes for RHEL 9

**Subscription Required:**
RHEL 9 requires a valid Red Hat subscription. After installation, you'll need to register:

```bash
sudo subscription-manager register --username YOUR_USERNAME --password YOUR_PASSWORD
sudo subscription-manager attach --auto
```

**ISO Source:**
- Download RHEL 9 ISO from: https://access.redhat.com/downloads/
- You need a Red Hat account (free developer subscription available)
- Use Red Hat Developer subscription for free: https://developers.redhat.com/

## Installation Configuration

Same as Rocky Linux:
- **Language:** English
- **Keyboard:** Swiss German (de-ch)
- **Timezone:** Europe/Zurich
- **Network:** DHCP
- **Root:** Disabled
- **User:** adminlocal / Passwort2025*
- **Installation:** Server (no GUI)
- **Firewall:** Disabled
- **Partitions:** /boot/efi 512MB, /boot 2GB, / rest, no swap

## Quick Start Methods

### Method 1: Simple USB (Recommended for RHEL)

1. **Create bootable USB with Rufus:**
   - Use original RHEL 9 ISO
   - Choose DD Image mode

2. **Add Kickstart file:**
   - Copy `rhel9-kickstart.ks` to USB root

3. **Boot and add parameter once:**
   - Press Tab (BIOS) or E (UEFI) at boot
   - Add: `inst.ks=hd:LABEL=RHEL-9-BaseOS-x86_64:/rhel9-kickstart.ks`
   - Press Enter

### Method 2: Custom ISO (Fully Automated)

Follow the same process as Rocky Linux but use RHEL 9 files:

1. **Extract RHEL 9 ISO** with 7-Zip

2. **Copy files:**
   - `rhel9-kickstart.ks` to root
   - `rhel9-isolinux.cfg` to `isolinux/isolinux.cfg`
   - `rhel9-grub.cfg` to `EFI/BOOT/grub.cfg`

3. **Create ISO with ImgBurn** (same as Rocky Linux guide)

4. **Write to USB with Rufus**

## Key Differences from Rocky Linux

1. **ISO Label:** `RHEL-9-BaseOS-x86_64` (instead of Rocky-9-BaseOS-x86_64)
2. **Subscription:** Requires Red Hat registration after install
3. **Support:** Official Red Hat support available
4. **Updates:** Updates come from Red Hat repositories

## Post-Installation Steps

**1. Register with Red Hat:**
```bash
sudo subscription-manager register
sudo subscription-manager attach --auto
```

**2. Verify registration:**
```bash
sudo subscription-manager status
```

**3. Update system (if not done during install):**
```bash
sudo dnf update -y
```

**4. Optional - Enable firewall:**
```bash
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

## Free Developer Subscription

Red Hat offers a free developer subscription:
- Visit: https://developers.redhat.com/register
- Register for free account
- Includes access to RHEL for development use
- 16 systems included
- No time limit

## Testing in VM

Before deploying on hardware:
1. Test in VirtualBox or VMware
2. Verify unattended installation works
3. Test subscription registration
4. Verify all settings

## Troubleshooting

**Subscription issues:**
- Ensure valid Red Hat account
- Check internet connectivity during registration
- Try: `sudo subscription-manager clean` then re-register

**ISO label mismatch:**
- Check actual label: Right-click USB → Properties
- Common labels: `RHEL-9-BaseOS-x86_64`, `RHEL-9-0-BaseOS-x86_64`
- Update boot configs if different

**Installation source not found:**
- Verify kickstart filename: `rhel9-kickstart.ks`
- Try: `inst.ks=hd:sdb1:/rhel9-kickstart.ks`
- Check USB partition is mountable

## Support Resources

- Red Hat Customer Portal: https://access.redhat.com/
- Documentation: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/
- Developer resources: https://developers.redhat.com/products/rhel/overview

## Compatibility

This kickstart is compatible with:
- RHEL 9.0, 9.1, 9.2, 9.3, 9.4, 9.5+
- Rocky Linux 9 (use rocky-kickstart.ks instead)
- AlmaLinux 9 (with minor modifications)
- Oracle Linux 9 (with minor modifications)
