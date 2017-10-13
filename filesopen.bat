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
FOR /f "tokens=1-8 delims=:./ " %%G IN ("%date%_%time%") DO (
SET datetime=%%G%%H%%I_%%J_%%K
)
REM _%%J_%%K if you want to remove seconds and micro seconds.

ECHO Please wait while Creating File List:
REM This will output files and folders from the current directory and all sub-directories.
dir "D:\xampp\htdocs\bhanu\Drupal8\R*.txt" /b /s > "fileslist_%datetime%.txt"

dir "D:\xampp\htdocs\bhanu\Drupal8\*.lock" /b /s >> "fileslist_%datetime%.txt"

dir "D:\xampp\htdocs\bhanu\Drupal8\*.*" /b /s >> "fileslist_%datetime%.txt"

REM The two >> means that the second line will be appended to the file (i.e. second line will start after the last line of xy.txt).

ECHO File List Created.

REM dir "Some\Directory" /b >some-file.txt
REM This will output files and folders from the current directory only.
REM dir "Some\Directory" /s /b *. >some-file.txt
REM This will output only the folders from the current directory and all sub-directories (no files).

pause
set command="C:\Program Files (x86)\Notepad++\notepad++.exe"
FOR /R D:\xampp\htdocs\bhanu\Drupal8\ %%a IN (*.lock) DO %command% %%a
cmd /k
REM ECHO Task has been performed Successfully.
pause 
goto end

:bye
ECHO BYE
goto end

:end