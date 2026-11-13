@echo off
chcp 65001 >nul
title LOL ITEMS - Offline Masaustu Uygulamasi
cd /d "%~dp0"

:: Edge veya Chrome Uygulama Modunda (--app) sekmesiz masaustu penceresi olarak baslat
where msedge >nul 2>nul
if %errorlevel%==0 (
    start "" msedge --app="file:///%~dp0index.html" --window-size=1600,920
    exit
)

where chrome >nul 2>nul
if %errorlevel%==0 (
    start "" chrome --app="file:///%~dp0index.html" --window-size=1600,920
    exit
)

:: Tarayici bulunamazsa varsayilan tarayicida ac
start "" "%~dp0index.html"
exit
