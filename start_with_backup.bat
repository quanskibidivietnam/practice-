@echo off
title Minecraft Server - Integrated Starter & Backup (v1.2)
color 0b

:: --- CONFIGURATION ---
set SERVER_JAR=server.jar
set RAM_MAX=4G
set RAM_MIN=4G
set BACKUP_SCRIPT=scripts/Backup/backup.bat
set NOTIFY_SCRIPT=scripts/Notifications/notify.bat

echo ======================================================
echo       MINECRAFT SERVER MANAGEMENT SUITE v1.2
echo ======================================================

:: 1. Tự động sao lưu trước khi chạy
if exist "%BACKUP_SCRIPT%" (
    echo [SYSTEM] Starting pre-run backup...
    call "%BACKUP_SCRIPT%"
) else (
    echo [WARNING] Backup script not found at %BACKUP_SCRIPT%
)

:: 2. Gửi thông báo tới Discord (nếu có)
if exist "%NOTIFY_SCRIPT%" (
    call "%NOTIFY_SCRIPT%" "🚀 Server is starting with a fresh backup!"
)

:: 3. Khởi động Server
:start
echo [SYSTEM] Launching Minecraft Server with %RAM_MAX% RAM...
java -Xmx%RAM_MAX% -Xms%RAM_MIN% -jar %SERVER_JAR% nogui

echo.
echo [SYSTEM] Server stopped. Restarting in 5 seconds...
echo [SYSTEM] Press Ctrl+C to cancel.
timeout /t 5
goto start
