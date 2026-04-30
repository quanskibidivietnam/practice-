@echo off
title Minecraft Server Backup
:: --- CẤU HÌNH ---
set WORLD_NAME=world
set BACKUP_DIR=Backups
set TIMESTAMP=%date:~10,4%-%date:~4,2%-%date:~7,2%_%time:~0,2%-%time:~3,2%
set TIMESTAMP=%TIMESTAMP: =0%

:: Tạo thư mục Backup nếu chưa có
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

echo Dang sao luu du lieu...
:: Sư dụng lệnh PowerShell để nén thư mục (có sẵn trên Windows)
powershell Compress-Archive -Path "%WORLD_NAME%" -DestinationPath "%BACKUP_DIR%\Backup_%TIMESTAMP%.zip"

echo Da sao luu xong vao thu muc %BACKUP_DIR%!
pause