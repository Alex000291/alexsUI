@echo off
setlocal

REM Set Node.js path to project's Node.js installation
set "PATH=%~dp0node-v22.16.0-win-x64;%PATH%"

cd frontend

REM Check if node_modules exists
if not exist "node_modules" (
    echo Installing dependencies...
    call npm install
) else (
    echo Dependencies already installed, skipping...
)

REM Check if dist exists
if not exist "dist" (
    echo Building project...
    call npm run build
) else (
    echo Project already built, skipping...
)

REM Start preview server
echo Starting preview server...
call npm run preview

pause
