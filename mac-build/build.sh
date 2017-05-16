#!/bin/bash
#
# execute with --user to make pip install in the user home
#
set -e

HERE="`dirname \"$0\"`"
USER="$1"
cd "$HERE"

mkdir -p ../dist/release

pwd
ls

echo "# build the app"
/usr/local/bin/platypus -P AYAB_bash.platypus -y ../dist/AYAB

echo "# create the .dmg file"
# see http://stackoverflow.com/a/367826/1320237
AYAB_DMG="`pwd`/dist/release/AYAB.dmg"
rm -f "$AYAB_DMG"
hdiutil create -srcfolder dist/AYAB.app "$AYAB_DMG"

echo "The installer can be found in \"$AYAB_DMG\"."

