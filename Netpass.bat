@echo off
title Wireless Password Retrieval Through Connection History Tool ~Rance Garrett
:Head
color 3d
echo Initializing WPRTCH
mode con: cols=150  lines=500
color 1a
echo.
echo What do you want to do?
color 1b
echo. 
echo Show History [1] or Specify SSID [2] or Exit [3]
echo.
set /p where=
echo.
if %where% == 1 goto Show
if %where% == 2 goto lead
if %where% == 3 goto Exit
:lead
echo Type SSID to Show Password immediately :
color 4F
pause
echo.
set /p ssid=
echo.
netsh wlan show profile name=%ssid% key=clear | findstr Key
color 2a
echo Save profile to path as well?
echo Okay [1] or Nah [2]
pause
set /p ok=
if %ok% == 1 goto profile
if %ok% == 2 goto Head
:profile
netsh wlan show profile name=%ssid% key=clear > D:\Rance\profile.txt
echo "profile.txt Copied to path Successfully!"
pause
goto Head
:Show
echo Show All Wireless Connection History :
pause
netsh wlan show profile name=* key=clear
pause
echo.
echo Specify SSID [1] or Exit [2]
set /p next=
echo.
if %next% == 1 goto lead
if %next% == 2 goto Exit
echo.
:Exit
echo Sure you want to Exit?
echo Options : [Y/N]
set /p sure=
if %sure% == Y goto Bye
if %sure% == N goto Head
:Bye
echo Goodbye!
Taskkill /IM "wscript.exe" /F >nul 2>&1
TimeOut /T 1 /NoBreak>nul
pause
Exit


