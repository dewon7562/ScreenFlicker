@echo off
:: screen_flicker.bat
:: Trolling tool to make the screen flicker by creating and removing a transparent overlay

echo WARNING: This will make your screen flicker! Press Ctrl+C to cancel...
timeout /t 10

:loop
:: Create a temporary VBS script to simulate brightness change
echo Set WShell = CreateObject("WScript.Shell") > %temp%\flicker.vbs
echo WShell.SendKeys "{F6}" >> %temp%\flicker.vbs

:: Run the VBS script
cscript //nologo %temp%\flicker.vbs

:: Wait for a random time between 1 and 5 seconds
set /a "delay=%random% %% 5 + 1"
timeout /t %delay% /nobreak >nul

:: Delete the VBS script
del %temp%\flicker.vbs

:: Repeat
goto loop
