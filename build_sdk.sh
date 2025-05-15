#!/bin/bash

[ ! -d "../androidjs-sdk" ] && mkdir ../androidjs-sdk

echo "Clearing sdk folder"
[ -d "../androidjs-sdk/lib" ] && rm -rf ../androidjs-sdk/*/

echo "Decompiling unsigned release apk..."
apktool d app/build/outputs/apk/release/app-release-unsigned.apk -o ../androidjs-sdk/temp -f
mv -f ../androidjs-sdk/temp/* ../androidjs-sdk/
rmdir ../androidjs-sdk/temp

echo "Prepending old header to apktool.yml"
mv ../androidjs-sdk/apktool.yml ../androidjs-sdk/apktool.tmp
echo "!!brut.androlib.meta.MetaInfo" > ../androidjs-sdk/apktool.yml
cat ../androidjs-sdk/apktool.tmp >> ../androidjs-sdk/apktool.yml
rm ../androidjs-sdk/apktool.tmp

echo "Updating version in config.json"
VERSION=`grep versionName app/build.gradle | cut -d'"' -f 2`
echo "{ \"version\": \"${VERSION}\" }" > ../androidjs-sdk/config.json

