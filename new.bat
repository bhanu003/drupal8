@ECHO off
cls
:start
ECHO.
ECHO 1. Press 1 to  Start Script 
ECHO 2. Exit
set choice=
set /p choice=Type the number to print text.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto end
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:con1
ECHO Please wait while Running Commands:

pause

setlocal enabledelayedexpansion enableextensions
set LIST=
for %%x in (D:\xampp\htdocs\bhanu\Drupal8\*.lock) do set LIST=!LIST! %%x
set LIST=%LIST:~1%

goto end

:bye
ECHO BYE
goto end

:end