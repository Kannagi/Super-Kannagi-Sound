#!/bin/sh

echo '[objects]' > temp
echo main.obj >> temp

wla-65816 -o main.asm main.obj
wlalink -vr temp main.smc

rm main.obj
rm temp
