@echo off
call curl https://raw.githubusercontent.com:443/taislin/civ13-server-win32/main/tools/update.bat -O update.bat
if not exist "./../initialized" (
  echo initialized > ./../initialized
  call "./init.bat"
)
cd..
cd server/
echo Updating from git...
call "./../tools/git/bin/git.exe" pull
echo.
echo Updating dependencies...
call "./../tools/node/npm" install --production
echo.
echo Transpiling the server...
call "./../tools/node/node.exe" ./node_modules/typescript/bin/tsc
echo.
echo Finished updating.