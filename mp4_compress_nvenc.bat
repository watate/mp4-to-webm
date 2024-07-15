@echo off
setlocal enabledelayedexpansion

:: Check if input file is provided
if "%~1"=="" (
    echo Usage: %0 inputfile
    exit /b 1
)

set inputfile=%~1
set outputfile=%~n1_compressed.mp4

:: Encode using NVENC (H.264)
ffmpeg -i "%inputfile%" -vf scale=764:1655 -c:v h264_nvenc -preset slow -b:v 5M -c:a aac -b:a 128k "%outputfile%"