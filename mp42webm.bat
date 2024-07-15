@echo off
setlocal enabledelayedexpansion

:: Check if input file is provided
if "%~1"=="" (
    echo Usage: %0 inputfile
    exit /b 1
)

set inputfile=%~1
set outputfile=%~n1.webm

:: First pass
ffmpeg -i "%inputfile%" -vf scale=342:740 -b:v 0 -crf 30 -pass 1 -an -f webm -y NUL

:: Second pass
ffmpeg -i "%inputfile%" -vf scale=342:740 -b:v 0 -crf 30 -pass 2 "%outputfile%"
