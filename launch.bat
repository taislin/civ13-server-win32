@echo off
echo [31m  ________  ______  ___________ ____  ________________[0m
echo [31m /_  __/\ \/ / __ \/ ____/ ___// __ \/ ____/ ___/ ___/[0m
echo [31m  / /    \  / /_/ / __/  \__ \/ /_/ / __/  \__ \\__ \ [0m
echo [31m / /     / / ____/ /___ ___/ / ____/ /___ ___/ /__/ / [0m
echo [31m/_/     /_/_/   /_____//____/_/   /_____//____/____/  [0m
echo.
if not exist "./initialized" (
  echo [33m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!![0m
  echo [33m!!! Detected first run, downloading and updating all the packages, please wait... !!![0m
  echo [33m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!![0m
  echo.
  echo initialized > ./initialized
  cd tools/
  call "./init.bat"
  cd..
)
cd server
call "./../tools/node/node.exe" index.js
pause