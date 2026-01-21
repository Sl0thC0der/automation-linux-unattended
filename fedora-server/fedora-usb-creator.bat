@echo off
echo ============================================
echo Fedora Server Autoinstall USB Creator
echo ============================================
echo.

REM Check if running as Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo WARNING: Not running as Administrator
    echo Some operations may require elevated privileges
    echo.
)

echo *** IMPORTANT: Understanding Fedora ***
echo Fedora is a cutting-edge distribution with:
echo - New releases every 6 months
echo - Support for only 13 months per release
echo - Latest software and features
echo - NOT recommended for production critical systems
echo.
echo For production, consider Rocky Linux 9 or Ubuntu 24.04 LTS instead.
echo.
set /p CONTINUE_FEDORA="Continue with Fedora? (Y/N): "
if /i not "%CONTINUE_FEDORA%"=="Y" exit /b

echo.
echo This script helps prepare Fedora Server autoinstall files.
echo.
echo Prerequisites:
echo 1. Rufus (https://rufus.ie/)
echo 2. Fedora Server ISO (https://fedoraproject.org/server/download)
echo 3. USB drive (8GB+)
echo.

set /p CONTINUE="Continue? (Y/N): "
if /i not "%CONTINUE%"=="Y" exit /b

echo.
echo Step 1: Checking for kickstart files...
echo.

set SCRIPT_DIR=%~dp0

if exist "%SCRIPT_DIR%fedora-kickstart.ks" (
    echo [OK] fedora-kickstart.ks found
) else (
    echo [ERROR] fedora-kickstart.ks not found in current directory
    pause
    exit /b
)

echo.
echo Step 2: Determine Fedora version...
echo.
echo Please enter your Fedora version number (e.g., 41, 40, 39)
set /p FEDORA_VERSION="Fedora version: "

if "%FEDORA_VERSION%"=="" (
    echo [ERROR] Version number required
    pause
    exit /b
)

echo.
echo Using Fedora %FEDORA_VERSION%
echo Expected ISO label: Fedora-S-dvd-x86_64-%FEDORA_VERSION%
echo.

echo.
echo Step 3: Instructions for USB creation
echo.
echo INSTRUCTIONS:
echo ============================================
echo.
echo 1. CREATE BOOTABLE USB WITH RUFUS:
echo    - Open Rufus
echo    - Select your USB drive
echo    - Select Fedora %FEDORA_VERSION% Server ISO
echo    - Partition scheme: GPT
echo    - Click START
echo    - Choose DD Image mode
echo    - Wait for completion
echo.
echo 2. After Rufus completes, press any key to continue...
pause >nul

echo.
echo 3. CHECKING FOR USB DRIVE:
echo.

set USB_DRIVE=
for %%D in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%D:\isolinux\isolinux.cfg" (
        echo Found Fedora USB at %%D:\
        set USB_DRIVE=%%D:
        goto :found_usb
    )
)

echo [WARNING] Could not auto-detect Fedora USB drive
echo.
set /p USB_DRIVE="Enter USB drive letter (e.g., E:): "

:found_usb

if not exist "%USB_DRIVE%\isolinux\isolinux.cfg" (
    echo [ERROR] This doesn't appear to be a Fedora USB drive
    echo Expected to find: %USB_DRIVE%\isolinux\isolinux.cfg
    pause
    exit /b
)

echo.
echo Step 4: Copying kickstart file...
echo.

copy "%SCRIPT_DIR%fedora-kickstart.ks" "%USB_DRIVE%\fedora-kickstart.ks"
if %errorLevel% equ 0 (
    echo [OK] Copied fedora-kickstart.ks to USB root
) else (
    echo [ERROR] Failed to copy kickstart file
    pause
    exit /b
)

echo.
echo Step 5: Backing up boot configuration...
echo.

if not exist "%USB_DRIVE%\isolinux\isolinux.cfg.backup" (
    copy "%USB_DRIVE%\isolinux\isolinux.cfg" "%USB_DRIVE%\isolinux\isolinux.cfg.backup"
    echo [OK] BIOS boot config backed up
)

if not exist "%USB_DRIVE%\EFI\BOOT\grub.cfg.backup" (
    copy "%USB_DRIVE%\EFI\BOOT\grub.cfg" "%USB_DRIVE%\EFI\BOOT\grub.cfg.backup"
    echo [OK] UEFI boot config backed up
)

echo.
echo Step 6: Updating boot configurations...
echo.
echo Updating ISO labels to match Fedora %FEDORA_VERSION%...
echo.

REM Update isolinux.cfg
if exist "%SCRIPT_DIR%fedora-isolinux.cfg" (
    echo Creating temp file with correct version...
    powershell -Command "(Get-Content '%SCRIPT_DIR%fedora-isolinux.cfg') -replace 'Fedora-S-dvd-x86_64-41', 'Fedora-S-dvd-x86_64-%FEDORA_VERSION%' | Set-Content '%TEMP%\isolinux.cfg.tmp'"
    copy "%TEMP%\isolinux.cfg.tmp" "%USB_DRIVE%\isolinux\isolinux.cfg"
    del "%TEMP%\isolinux.cfg.tmp"
    echo [OK] Updated isolinux.cfg with Fedora %FEDORA_VERSION%
) else (
    echo [WARNING] fedora-isolinux.cfg not found
    echo You'll need to manually edit boot configs
)

REM Update grub.cfg
if exist "%SCRIPT_DIR%fedora-grub.cfg" (
    echo Creating temp file with correct version...
    powershell -Command "(Get-Content '%SCRIPT_DIR%fedora-grub.cfg') -replace 'Fedora-S-dvd-x86_64-41', 'Fedora-S-dvd-x86_64-%FEDORA_VERSION%' | Set-Content '%TEMP%\grub.cfg.tmp'"
    copy "%TEMP%\grub.cfg.tmp" "%USB_DRIVE%\EFI\BOOT\grub.cfg"
    del "%TEMP%\grub.cfg.tmp"
    echo [OK] Updated grub.cfg with Fedora %FEDORA_VERSION%
) else (
    echo [WARNING] fedora-grub.cfg not found
    echo You'll need to manually edit boot configs
)

echo.
echo ============================================
echo FEDORA %FEDORA_VERSION% USB PREPARATION COMPLETE!
echo ============================================
echo.
echo Your Fedora Server autoinstall USB is ready.
echo.
echo Files on USB:
echo - %USB_DRIVE%\fedora-kickstart.ks
echo - %USB_DRIVE%\isolinux\isolinux.cfg (modified)
echo - %USB_DRIVE%\EFI\BOOT\grub.cfg (modified)
echo - Backups saved with .backup extension
echo.
echo Fedora %FEDORA_VERSION% Information:
echo - Cutting-edge release
echo - Support: ~13 months
echo - Requires regular upgrades
echo - Best for: Development, testing, learning
echo.
echo *** IMPORTANT REMINDERS ***
echo - Fedora releases expire after ~13 months
echo - Plan to upgrade every 6 months
echo - NOT recommended for production critical systems
echo - For production: Use Rocky Linux 9 or Ubuntu LTS
echo.
echo Next steps:
echo 1. Safely eject USB drive
echo 2. Boot target system from USB
echo 3. Installation will start automatically
echo 4. System will reboot when complete
echo 5. Login as: adminlocal / Passwort2025*
echo 6. Plan your first system upgrade (in 6 months)
echo.
echo Press any key to open USB drive in Explorer...
pause >nul
explorer %USB_DRIVE%\
