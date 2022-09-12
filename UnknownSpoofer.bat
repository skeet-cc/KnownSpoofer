@shift /0
@echo off

chcp 65001

mode con: cols=77 lines=18




openfiles >NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin 
goto disclaimer

:disclaimer

title UnknownSpoofer

color 4

echo.
echo.
echo.
echo -----------------------------------WARNING-----------------------------------
echo.
echo 		 UnknownSpoofer is only distributed on unknowncheats!
echo  If you downloaded this Spoofer from another Source its most likely an Virus
echo.
echo  	     !UnknownSpoofer was designed for Educational Purposes only!
echo.
echo                              Full credits go to 

echo.
echo                                10HEAD(3807952)
echo.

echo                                  danke bre 
echo.
echo -----------------------------------WARNING-----------------------------------
echo.

timeout /t 8 /nobreak >NUL


goto right

:RIGHT

color 0B

cls

echo Welcome %USERNAME%!
echo.
echo Please select one of the following options:
echo.
echo (1)Check Serials
echo.
echo (2)Spoof
echo.
echo (3)READ FIRST
echo.

choice /c 123 /m "=>"

if ERRORLEVEL 3 goto Important
if ERRORLEVEL 2 goto Spoof
if ERRORLEVEL 1 goto Serials

:Serials
cls
wmic diskdrive get serialnumber
wmic memorychip get serialnumber
wmic baseboard get serialnumber
pause
cls

goto :RIGHT

:Spoof

cls

cd C:\Users\%USERNAME%\Desktop\UnknownSpoofer\temp\spoof

title Spoofing SystemUUID



AMIDEWIN.EXE /SU /BS

timeout /t 2 /nobreak >NUL

start AMIDEWIN.EXE /SU auto

timeout /t 2 /nobreak >NUL
cls

set /a num1=%random% %%10

set /a num2=%random% %%10

set /a num3=%random% %%10

set /a num4=%random% %%10

set /a num5=%random% %%10

set /a num6=%random% %%10

set /a num7=%random% %%10

set /a num8=%random% %%10

set /a num9=%random% %%10

set /a num10=%random% %%10

title Spoofing Baseboard Serial number

AMIDEWIN.EXE /BS 261-BS-%num1%%num2%%num3%%num4%%num5%



timeout /t 2 /nobreak >NUL

goto VOLID

:VOLID


title Initiating VOLID

cls

move C:\Users\%USERNAME%\Desktop\UnknownSpoofer\temp\spoof\Volumeid.exe C:\

move C:\Users\%USERNAME%\Desktop\UnknownSpoofer\temp\spoof\Volumeid64.exe C:\

timeout /t 2 /nobreak >NUL

cd C:/

cls

volumeid c: %num1%%num2%%num3%C-%num4%%num5%%num6%%num7%

timeout /t 3 /nobreak >NUL

cls

volumeid d: %num9%%num8%%num7%D-%num6%%num5%%num4%%num3%

timeout /t 3 /nobreak >NUL

goto mac

:mac

cls

title MAC


cls
echo -----------------------------
echo     Changing MAC-Adress
echo -----------------------------

@shift /0

 SETLOCAL ENABLEDELAYEDEXPANSION
 SETLOCAL ENABLEEXTENSIONS
 
 FOR /F "tokens=1" %%a IN ('wmic nic where physicaladapter^=true get deviceid ^| findstr [0-9]') DO (
 CALL :MAC
 FOR %%b IN (0 00 000) DO (
 REG QUERY HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}\%%b%%a >NUL 2>NUL && REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}\%%b%%a /v NetworkAddress /t REG_SZ /d !MAC!  /f >NUL 2>NUL
 )
 )
 
 FOR /F "tokens=1" %%a IN ('wmic nic where physicaladapter^=true get deviceid ^| findstr [0-9]') DO (
 FOR %%b IN (0 00 000) DO (
 REG QUERY HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}\%%b%%a >NUL 2>NUL && REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}\%%b%%a /v PnPCapabilities /t REG_DWORD /d 24 /f >NUL 2>NUL
 )
 )
 
 FOR /F "tokens=2 delims=, skip=2" %%a IN ('"wmic nic where (netconnectionid like '%%') get netconnectionid,netconnectionstatus /format:csv"') DO (
 netsh interface set interface name="%%a" disable >NUL 2>NUL
 netsh interface set interface name="%%a" enable >NUL 2>NUL
 )
 
 GOTO :EOF
 :MAC
 SET COUNT=0
 SET GEN=ABCDEF0123456789
 SET GEN2=26AE
 SET MAC=
 :MACLOOP
 SET /a COUNT+=1
 SET RND=%random%
 SET /A RND=RND%%16
 SET RNDGEN=!GEN:~%RND%,1!
 SET /A RND2=RND%%4
 SET RNDGEN2=!GEN2:~%RND2%,1!
 IF "!COUNT!"  EQU "2" (SET MAC=!MAC!!RNDGEN2!) ELSE (SET MAC=!MAC!!RNDGEN!)
 IF !COUNT!  LEQ 11 GOTO MACLOOP

timeout /t 3 /nobreak >NUL

goto biosflash

:biosflash
color 4
cls
title BiosFlash
echo !!!!WARNING: WITHOUT FLASHING BIOS THE WHOLE PROCESS DOESNT WORK!!!!

echo.
echo.
echo Main Spoofing completed, now you have to Flash your bios!




echo.
echo.
echo You will be redirected to the Tutorial according to your MotherBoard.

echo.
echo.
echo.
echo Press ENTER if understood

pause

goto MOBO

:MOBO
cls
color 0B

cd C:\Users\%USERNAME%\Desktop\UnknownSpoofer\temp

type ascii2.txt

echo.
echo Select one of the following MotherBoards
echo (1)Asus
echo.
echo (2)Gigabyte
echo.
echo (3)Other
echo.

choice /c 123 /m "=>"

if ERRORLEVEL 3 goto Other
if ERRORLEVEL 2 goto Gigabyte
if ERRORLEVEL 1 goto Asus

:Asus

start "" https://www.asus.com/support/FAQ/1044348/
msg * Please vouch if it worked!
exit
:Gigabyte

start "" https://www.gigabyte.com/WebPage/20/HowToReflashBIOS.html
msg * Please vouch if it worked!
exit
:Other

start "" https://www.google.com/search?q=Flash+bios+YOURMOTHERBOARD
msg * Please vouch if it worked!
exit

:Important

mode con: cols=77 lines=12

echo ----------------------------------IMPORTANT----------------------------------
echo                            HOW TO USE UNKNOWNSPOOFER
echo.
echo                (1)Format drives and reinstall Windows via USB
echo.
echo               (2)Use UnknownSpoofer and follow the Instructions
echo.
echo              (3)Reinstall prefered game and create a NEW Account
echo.
echo                                  (4)Have Fun!
echo ----------------------------------IMPORTANT----------------------------------

timeout /t 69 /nobreak >NUL

goto right

:WRONG

msg * WRONG KEY

exit

timeout /t 10 /nobreak >NUL
