@echo off
setlocal enabledelayedexpansion

:: Check if input file is provided
if "%~1"=="" (
    echo Usage: %0 inputfile
    exit /b 1
)

set inputfile=%~1
set outputfile=%~n1.webp

:: Extract the first frame and save as webp
ffmpeg -i "%inputfile%" -vf "scale=342:-1" -vframes 1 "%outputfile%"
