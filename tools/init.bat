@echo off
call "./7za/7za.exe" x git.7z -y
call "./7za/7za.exe" x node.7z -y
call "./git/bin/git.exe" init ./../server
cd..
call "./tools/7za/7za.exe" x server.7z -y
cd server/
call "./../tools/git/bin/git.exe" config core.sparseCheckout true
cd .git
cd info
echo code/ > sparse-checkout
echo config/ >> sparse-checkout
echo maps/ >> sparse-checkout
echo scripts/ >> sparse-checkout
echo strings/ >> sparse-checkout
echo src/ >> sparse-checkout
echo index.ts >> sparse-checkout
echo package.json >> sparse-checkout
echo package-lock.json >> sparse-checkout
echo tsconfig.json >> sparse-checkout
cd..
cd..
call "./../tools/git/bin/git.exe" config --global init.defaultBranch master
call "./../tools/git/bin/git.exe" remote add origin https://github.com/civ13/civ13-typespess
call "./../tools/git/bin/git.exe" fetch --depth=1 origin master
call "./../tools/git/bin/git.exe" checkout master
call "./../tools/node/npm" config set scripts-prepend-node-path auto
call "./../tools/node/npm" install --production
call "./../tools/node/node.exe" ./node_modules/typescript/bin/tsc
cd maps/
call "./../../tools/node/node.exe" "./mapgen.js"
echo done.