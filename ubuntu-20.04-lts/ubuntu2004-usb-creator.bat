@echo off
echo ============================================
echo Ubuntu 20.04 LTS Autoinstall USB Creator
echo ============================================
echo.

REM Check if running as Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo WARNING: Not running as Administrator
    echo Some operations may require elevated privileges
    echo.
)

echo *** WARNING ***
echo Ubuntu 20.04 LTS support ends in April 2025 (6 months away!)
echo Consider using Ubuntu 22.04 or 24.04 LTS instead.
echo.
set /p CONTINUE_20="Are you sure you want to use 20.04? (Y/N): "
if /i not "%CONTINUE_20%"=="Y" (
    echo.
    echo Recommended alternatives:
    echo - Ubuntu 24.04 LTS (supported until 2029)
    echo - Ubuntu 22.04 LTS (supported until 2027)
    echo.
    pause
    exit /b
)

echo.
echo This script helps prepare Ubuntu 20.04 LTS autoinstall files.
echo.
echo Prerequisites:
echo 1. Rufus (https://rufus.ie/)
echo 2. Ubuntu 20.04 LTS Server ISO (https://ubuntu.com/download/server)
echo 3. USB drive (8GB+)
echo.

set /p CONTINUE="Continue? (Y/N): "
if /i not "%CONTINUE%"=="Y" exit /b

echo.
echo Step 1: Checking for autoinstall files...
echo.

set SCRIPT_DIR=%~dp0

if exist "%SCRIPT_DIR%ubuntu2004-user-data" (
    echo [OK] ubuntu2004-user-data found
) else (
    echo [ERROR] ubuntu2004-user-data not found in current directory
    pause
    exit /b
)

if exist "%SCRIPT_DIR%ubuntu2004-meta-data" (
    echo [OK] ubuntu2004-meta-data found
) else (
    echo [ERROR] ubuntu2004-meta-data not found in current directory
    pause
    exit /b
)

echo.
echo Step 2: Instructions for USB creation
echo.
echo INSTRUCTIONS:
echo ============================================
echo.
echo 1. CREATE BOOTABLE USB WITH RUFUS:
echo    - Open Rufus
echo    - Select your USB drive
echo    - Select Ubuntu 20.04 LTS Server ISO
echo    - Partition scheme: GPT
echo    - Click START
echo    - Wait for completion
echo.
echo 2. After Rufus completes, press any key to continue...
pause >nul

echo.
echo 3. CHECKING FOR USB DRIVE:
echo.

set USB_DRIVE=
for %%D in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%D:\boot\grub\grub.cfg" (
        echo Found Ubuntu USB at %%D:\
        set USB_DRIVE=%%D:
        goto :found_usb
    )
)

echo [WARNING] Could not auto-detect Ubuntu USB drive
echo.
set /p USB_DRIVE="Enter USB drive letter (e.g., E:): "

:found_usb

if not exist "%USB_DRIVE%\boot\grub\grub.cfg" (
    echo [ERROR] This doesn't appear to be an Ubuntu USB drive
    echo Expected to find: %USB_DRIVE%\boot\grub\grub.cfg
    pause
    exit /b
)

echo.
echo Step 3: Creating autoinstall directory...
echo.

if not exist "%USB_DRIVE%\autoinstall" (
    mkdir "%USB_DRIVE%\autoinstall"
    echo [OK] Created %USB_DRIVE%\autoinstall
) else (
    echo [OK] Directory already exists: %USB_DRIVE%\autoinstall
)

echo.
echo Step 4: Copying autoinstall files...
echo.

copy "%SCRIPT_DIR%ubuntu2004-user-data" "%USB_DRIVE%\autoinstall\user-data"
if %errorLevel% equ 0 (
    echo [OK] Copied user-data
) else (
    echo [ERROR] Failed to copy user-data
    pause
    exit /b
)

copy "%SCRIPT_DIR%ubuntu2004-meta-data" "%USB_DRIVE%\autoinstall\meta-data"
if %errorLevel% equ 0 (
    echo [OK] Copied meta-data
) else (
    echo [ERROR] Failed to copy meta-data
    pause
    exit /b
)

echo.
echo Step 5: Backing up grub.cfg...
echo.

if not exist "%USB_DRIVE%\boot\grub\grub.cfg.backup" (
    copy "%USB_DRIVE%\boot\grub\grub.cfg" "%USB_DRIVE%\boot\grub\grub.cfg.backup"
    echo [OK] Backup created
) else (
    echo [OK] Backup already exists
)

echo.
echo Step 6: Modifying grub.cfg...
echo.

if exist "%SCRIPT_DIR%ubuntu2004-grub.cfg" (
    copy "%SCRIPT_DIR%ubuntu2004-grub.cfg" "%USB_DRIVE%\boot\grub\grub.cfg"
    echo [OK] Replaced grub.cfg with Ubuntu 20.04 autoinstall version
) else (
    echo [WARNING] ubuntu2004-grub.cfg not found
    echo You will need to manually edit: %USB_DRIVE%\boot\grub\grub.cfg
    echo.
    echo Add this after "vmlinuz": autoinstall ds=nocloud;s=/cdrom/autoinstall/
    echo Change timeout to: set timeout=1
    echo.
    set /p OPEN_FILE="Open grub.cfg in Notepad now? (Y/N): "
    if /i "%OPEN_FILE%"=="Y" (
        notepad "%USB_DRIVE%\boot\grub\grub.cfg"
    )
)

echo.
echo ============================================
echo UBUNTU 20.04 LTS USB PREPARATION COMPLETE!
echo ============================================
echo.
echo Your Ubuntu 20.04 LTS autoinstall USB is ready.
echo.
echo Files on USB:
echo - %USB_DRIVE%\autoinstall\user-data
echo - %USB_DRIVE%\autoinstall\meta-data
echo - %USB_DRIVE%\boot\grub\grub.cfg (modified)
echo - %USB_DRIVE%\boot\grub\grub.cfg.backup (original)
echo.
echo *** IMPORTANT REMINDER ***
echo Ubuntu 20.04 LTS support ends April 2025 (6 months!)
echo - Standard updates end: April 2025
echo - Extended support available with Ubuntu Pro until 2030
echo - Consider upgrading to 22.04 or 24.04 soon
echo.
echo Next steps:
echo 1. Safely eject USB drive
echo 2. Boot target system from USB
echo 3. Installation will start automatically
echo 4. System will reboot when complete
echo 5. Login as: adminlocal / Passwort2025*
echo 6. PLAN UPGRADE to newer LTS version
echo.
echo Press any key to open USB drive in Explorer...
pause >nul
explorer %USB_DRIVE%\
