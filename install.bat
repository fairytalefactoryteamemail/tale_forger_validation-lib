@echo off
title Install validation-lib
color 0A

echo ====================================================
echo   Installing Taleforger Library
echo   Package: validation-lib
echo ====================================================
echo.

:: بررسی وجود taleforger در PATH
echo [1/2] Checking taleforger...
where taleforger >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    color 0C
    echo [ERROR] taleforger is not in PATH.
    echo.
    echo Please make sure Taleforger SDK is installed and
    echo its directory is added to your system PATH.
    pause
    exit /b 1
)
echo [OK] taleforger found
echo.

:: نصب از پوشهٔ فعلی
echo [2/2] Installing...
taleforger install "%~dp0"
if %ERRORLEVEL% NEQ 0 (
    color 0C
    echo.
    echo [FAILED] Installation failed.
    pause
    exit /b 1
)

color 0A
echo.
echo ====================================================
echo   Installation Complete!
echo ====================================================
echo.
echo Usage in your .tafo files:
echo   import "validation-lib" as Lib;
echo   print(Lib.hello("World"));
echo.
pause