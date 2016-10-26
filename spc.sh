#!/bin/sh

echo '[objects]' > temp
echo driver.obj >> temp

wla-spc700 -o driver.aspc driver.obj
wlalink -vr temp SKSdriver.spc

rm driver.obj
rm temp
