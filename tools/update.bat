@echo off
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
call "./../tools/node/npx" tsc
echo.
echo Finished updating.