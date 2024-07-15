@echo off
setlocal enabledelayedexpansion

:: Check if input file is provided
if "%~1"=="" (
    echo Usage: %0 inputfile
    exit /b 1
)

set inputfile=%~1
set outputfile=%~n1_cut.mp4

:: Cut the video from 0:10 to 0:13
ffmpeg -i "%inputfile%" -ss 00:00:10 -to 00:00:13 -c copy "%outputfile%"
