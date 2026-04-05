@echo off

title Classic GUI Installer
mode con: cols=42 lines=11

echo ==========================================
echo Classic GUI Installer
echo sets up thy macro and required features
echo this concludes of:
echo firewall rule and txt for lagswitch
echo and a preset macro (Optional)
echo anyways press any key to continue.
echo for best experience of this please
echo don't resize the window.
echo ==========================================
pause >nul

mode con: cols=66 lines=15

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Run the installer as administrator please.
    pause
    exit
)

for /d %%G in ("%LocalAppData%\Roblox\Versions\*") do (
    if exist "%%G\RobloxPlayerBeta.exe" (
        set "robloxdirectory=%%G\RobloxPlayerBeta.exe"
    )
)

if exist "%PROGRAMFILES%\AutoHotkey\" (
    goto AutoHotkeyInstalled
)

pause
echo This script uses AutoHotkey. Install? (Y/N)
set "choice="
set /p choice=

if /i "%choice%"=="Y" (
    curl -L -# -o "%TEMP%\ahk-v2.exe" https://www.autohotkey.com/download/ahk-v2.exe
    echo Launching the ahk-v2 installer!
    start /wait "" "%TEMP%\ahk-v2.exe"
    echo Please complete the installer manually.
    del "%TEMP%\ahk-v2.exe"
    echo Note to run the AutoHotkey v2.0 Installer as administrator as it requests or else it will not install and act as a cancel option
    pause
    cls
    echo AutoHotkey v2.0 Installer has been installed in the %TEMP% dir and will be deleted after the setup just to clarify.
)

:AutoHotkeyInstalled
cd /d "%~dp0"
echo Setting up features that may rely on other files e.t.c
pause
echo Creating TXT and Firewall rule for lagswitch feature.
echo Firewall rule helps block UDP traffic for roblox acting as a lagswitch.
if exist "%~dp0LagRuleCreated.txt" (
    echo TXT Already exists.
) else (
    echo 1 > LagRuleCreated.txt
    echo TXT File created.
    echo If the file is outside the bats dir %~dp0 then you may delete the copy created and drag the one outside the dir
)

pause

set "found="
for /f "delims=" %%A in ('netsh advfirewall firewall show rule name^="RobloxLagSwitch" ^| find "RobloxLagSwitch"') do set found=1

if defined found (
    echo Firewall Rule already exists.
) else (
    netsh advfirewall firewall add rule name="RobloxLagSwitch" dir=out action=block protocol=UDP program="%robloxdirectory%" enable=no >nul 2>&1
    echo Firewall Rule was created!
)
pause
cls
echo Would you like to create a preset macro on your computer to give you a hang of the macro creator? (Y/N)
set "choice="
set /p choice=

if /i "%choice%"=="Y" (
    echo Creating preset macro (simply clicks every few miliseconds)
    (
    echo Mouse^|Left^|50
    echo Delay^|500^|0
    ) > "MyMacro.macroguiclassic"
    echo Macro created, to replicate this add a mouse click value L then add a delay with the value 500.
) else (
    echo Setup complete!
    timeout /t 5
    exit
)