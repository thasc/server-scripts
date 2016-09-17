#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source ../sourcebyond.sh

pushd custom-items
git pull
cp config/* ~/_live_server/live/config
popd

#pushd tgui
#node_modules/.bin/gulp
#popd

git pull
scripts/dm.sh baystation12.dme -Ibs12.opt.dm
#DreamMaker baystation12.dme

#doesn't work, needs to be encrypted!
#zip ~/public_html/baystation12.rsc.zip baystation12.rsc -u

rsync -rui --include-from=rsync-include.inc . ../live

cd ../live
flyway validate -configFile=flyway-db.conf
