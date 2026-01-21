@echo off
echo ============================================
echo Rocky Linux Custom ISO Builder - Windows
echo ============================================
echo.

REM Check if running as Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo WARNING: Not running as Administrator
    echo Some operations may require elevated privileges
    echo.
)

echo Step 1: Checking prerequisites...
echo.

REM Check for 7-Zip
if exist "C:\Program Files\7-Zip\7z.exe" (
    echo [OK] 7-Zip found
) else (
    echo [MISSING] 7-Zip not found
    echo Please download from: https://www.7-zip.org/
)

REM Check for ImgBurn
if exist "C:\Program Files (x86)\ImgBurn\ImgBurn.exe" (
    echo [OK] ImgBurn found
) else if exist "C:\Program Files\ImgBurn\ImgBurn.exe" (
    echo [OK] ImgBurn found
) else (
    echo [MISSING] ImgBurn not found
    echo Please download from: https://www.imgburn.com/
)

echo.
echo Step 2: Checking for Rocky Linux ISO...
echo.

set /p ISO_PATH="Enter full path to Rocky Linux ISO (or drag and drop): "
if exist %ISO_PATH% (
    echo [OK] ISO file found: %ISO_PATH%
) else (
    echo [ERROR] ISO file not found!
    pause
    exit /b
)

echo.
echo Step 3: Setting up build directory...
echo.

set BUILD_DIR=C:\RockyBuild
if exist %BUILD_DIR% (
    echo Build directory already exists: %BUILD_DIR%
    set /p CLEANUP="Delete existing directory? (Y/N): "
    if /i "%CLEANUP%"=="Y" (
        rd /s /q %BUILD_DIR%
        mkdir %BUILD_DIR%
        echo [OK] Build directory recreated
    )
) else (
    mkdir %BUILD_DIR%
    echo [OK] Build directory created: %BUILD_DIR%
)

echo.
echo Step 4: Extracting ISO...
echo.

if exist "C:\Program Files\7-Zip\7z.exe" (
    "C:\Program Files\7-Zip\7z.exe" x %ISO_PATH% -o%BUILD_DIR% -y
    echo [OK] ISO extracted to %BUILD_DIR%
) else (
    echo [ERROR] Please extract the ISO manually using 7-Zip
    echo Extract to: %BUILD_DIR%
    pause
)

echo.
echo Step 5: Copy Kickstart file...
echo.

set KS_SOURCE=%~dp0rocky-kickstart.ks
if exist %KS_SOURCE% (
    copy %KS_SOURCE% %BUILD_DIR%\rocky-kickstart.ks
    echo [OK] Kickstart file copied
) else (
    echo [WARNING] rocky-kickstart.ks not found in current directory
    echo Please copy rocky-kickstart.ks manually to: %BUILD_DIR%
)

echo.
echo Step 6: Copy boot configuration files...
echo.

set ISO_CFG_SOURCE=%~dp0isolinux.cfg
set GRUB_CFG_SOURCE=%~dp0grub.cfg

if exist %ISO_CFG_SOURCE% (
    copy %ISO_CFG_SOURCE% %BUILD_DIR%\isolinux\isolinux.cfg
    echo [OK] isolinux.cfg copied
) else (
    echo [WARNING] isolinux.cfg not found
    echo Please edit manually: %BUILD_DIR%\isolinux\isolinux.cfg
)

if exist %GRUB_CFG_SOURCE% (
    copy %GRUB_CFG_SOURCE% %BUILD_DIR%\EFI\BOOT\grub.cfg
    echo [OK] grub.cfg copied
) else (
    echo [WARNING] grub.cfg not found
    echo Please edit manually: %BUILD_DIR%\EFI\BOOT\grub.cfg
)

echo.
echo ============================================
echo Setup Complete!
echo ============================================
echo.
echo Next steps:
echo 1. Verify files in: %BUILD_DIR%
echo 2. Check boot configurations are correct
echo 3. Open ImgBurn to create the ISO:
echo    - Mode: Create image from files/folders
echo    - Source: %BUILD_DIR%
echo    - Bootable: Yes
echo    - Boot image: %BUILD_DIR%\isolinux\isolinux.bin
echo    - Load Segment: 07C0
echo    - Sectors: 4
echo 4. Write ISO to USB with Rufus
echo.
echo Press any key to open build directory...
pause >nul
explorer %BUILD_DIR%
