@echo off
chcp 65001 >nul
title LOL ITEMS - Masaustu Kisayolu Olusturucu
cd /d "%~dp0"

set "APP_DIR=%~dp0"
set "BAT_PATH=%~dp0Baslat_Offline_Uygulama.bat"
set "ICO_PATH=%~dp0lol_items_icon.ico"

echo ========================================================
echo   LOL ITEMS - Masaustu Kisayolu Olusturuluyor...
echo ========================================================

powershell -NoProfile -ExecutionPolicy Bypass -Command "$s = (New-Object -ComObject WScript.Shell).CreateShortcut((Join-Path ([Environment]::GetFolderPath('Desktop')) 'LOL ITEMS.lnk')); $s.TargetPath = $env:BAT_PATH; $s.WorkingDirectory = $env:APP_DIR; $s.IconLocation = $env:ICO_PATH + ',0'; $s.WindowStyle = 7; $s.Description = 'LOL ITEMS - Offline Simulator'; $s.Save()"

if %errorlevel%==0 (
    echo.
    echo [BASARILI] "LOL ITEMS" masaustu kisayolu Hextech ikonuyla masaustunuze eklendi!
) else (
    echo.
    echo [HATA] Kisayol olusturulurken bir sorun olustu.
)
echo.
pause
