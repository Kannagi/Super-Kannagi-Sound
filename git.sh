#!/bin/sh
read message
echo \"$message\"
#git init
git add *.sh
#git add driver.aspc
#git add SKSdriver.spc
#git add music/*
#git add SNESMIDI/*
#git add SPC/*

#git add main.smc
#git add README.md


git commit -m "$message"
git remote add origin https://github.com/Kannagi/Super-Kannagi-Sound.git
git push -u origin master