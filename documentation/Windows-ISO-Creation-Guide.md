# Create Custom Rocky Linux ISO on Windows

## Method 1: Using PowerShell Script (Recommended)

### Prerequisites
1. Download Rocky Linux 9 ISO from: https://rockylinux.org/download
2. Download and install **ImgBurn** from: https://www.imgburn.com/
3. Download **7-Zip** from: https://www.7-zip.org/

### Steps

1. **Extract the ISO**
   - Right-click the Rocky Linux ISO
   - Select "7-Zip" → "Extract to folder"
   - Let's say you extract to: `C:\RockyBuild\`

2. **Copy your Kickstart file**
   - Copy `rocky-kickstart.ks` to the root of extracted ISO
   - Location: `C:\RockyBuild\rocky-kickstart.ks`

3. **Modify Boot Configuration for BIOS**
   - Open: `C:\RockyBuild\isolinux\isolinux.cfg` in Notepad
   - Find the line that starts with `timeout`
   - Change it to: `timeout 10`
   - Find the line that starts with `default`
   - Change it to: `default linux`
   - Find the `label linux` or `label check` section
   - Find the line starting with `append`
   - Add to the end of that line: ` inst.ks=hd:LABEL=Rocky-9-BaseOS-x86_64:/rocky-kickstart.ks`
   
   Example:
   ```
   timeout 10
   default linux
   
   label linux
     menu label ^Install Rocky Linux 9
     kernel vmlinuz
     append initrd=initrd.img inst.stage2=hd:LABEL=Rocky-9-BaseOS-x86_64 quiet inst.ks=hd:LABEL=Rocky-9-BaseOS-x86_64:/rocky-kickstart.ks
   ```

4. **Modify Boot Configuration for UEFI**
   - Open: `C:\RockyBuild\EFI\BOOT\grub.cfg` in Notepad
   - Find the line: `set timeout=60`
   - Change it to: `set timeout=1`
   - Find the `menuentry 'Install Rocky Linux'` section
   - Find the line starting with `linuxefi`
   - Add to the end: ` inst.ks=hd:LABEL=Rocky-9-BaseOS-x86_64:/rocky-kickstart.ks`
   
   Example:
   ```
   set timeout=1
   
   menuentry 'Install Rocky Linux 9' {
       linuxefi /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=Rocky-9-BaseOS-x86_64 quiet inst.ks=hd:LABEL=Rocky-9-BaseOS-x86_64:/rocky-kickstart.ks
       initrdefi /images/pxeboot/initrd.img
   }
   ```

5. **Create the Custom ISO using ImgBurn**
   - Open ImgBurn
   - Click "Create image file from files/folders"
   - Click the folder icon and select: `C:\RockyBuild\`
   - Go to "Advanced" → "Bootable Disc" tab
   - Check "Make Image Bootable"
   - Boot Image: Browse to `C:\RockyBuild\isolinux\isolinux.bin`
   - Developer ID: Leave blank
   - Load Segment: `07C0`
   - Sectors To Load: `4`
   - Click "Advanced" → "Restrictions" tab
   - ISO9660: Check everything
   - Click the "Build" button (big icon at bottom)
   - Save as: `Rocky-9-Unattended.iso`

6. **Write to USB**
   - Use **Rufus** (download from: https://rufus.ie/)
   - Select your USB drive
   - Select your `Rocky-9-Unattended.iso`
   - Partition scheme: GPT (for UEFI) or MBR (for BIOS)
   - Click "Start"

---

## Method 2: Manual Method (Simpler, No ISO rebuild)

If you just want to use USB without creating a custom ISO:

1. **Create bootable USB with Rufus**
   - Download Rufus: https://rufus.ie/
   - Insert USB drive (8GB+ recommended)
   - Open Rufus
   - Select your USB drive
   - Select Rocky Linux ISO
   - Partition scheme: GPT for UEFI or MBR for BIOS
   - Click "Start"
   - Choose "DD Image" mode when prompted

2. **Add Kickstart file**
   - After Rufus completes, your USB will be bootable
   - Copy `rocky-kickstart.ks` to the root of the USB drive
   - Note: The USB label will likely be `Rocky-9-BaseOS-x86_64`

3. **Boot and manually add parameter**
   - Boot from USB
   - When boot menu appears, press **Tab** (BIOS) or **e** (UEFI)
   - Add to the end of the linux/linuxefi line:
     ```
     inst.ks=hd:LABEL=Rocky-9-BaseOS-x86_64:/rocky-kickstart.ks
     ```
   - Press **Enter** to boot

**Note:** With Method 2, you still need to manually add the boot parameter once, but it's much simpler than creating a custom ISO.

---

## Method 3: Using WSL (Windows Subsystem for Linux)

If you have WSL installed, you can use Linux tools:

1. Enable WSL in Windows
2. Install Ubuntu from Microsoft Store
3. Use the Linux commands to rebuild the ISO (similar to a Linux system)

Would you like instructions for this method?

---

## Troubleshooting

**ISO label mismatch:**
- Check your USB/ISO label with: Right-click USB → Properties → Volume label
- Update the `LABEL=` in boot configs to match exactly

**Boot doesn't start automatically:**
- Verify timeout values are set correctly
- Verify `default` is set in isolinux.cfg
- Ensure kickstart file is in the root directory

**Kickstart file not found:**
- Ensure filename is exactly: `rocky-kickstart.ks`
- Check the LABEL matches your USB/ISO label
- Try: `inst.ks=hd:sdb1:/rocky-kickstart.ks` (where sdb1 is your USB partition)
