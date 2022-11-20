#!/bin/bash

sub1='https://github.com/793338023/sub-vue.git'
sub2='https://github.com/793338023/sub-react.git'
sub3='https://github.com/793338023/sub-html.git'

subName=(sub-vue sub-react sub-html)

subs=($sub1 $sub2 $sub3)

for i in "${!subName[@]}"
do  
{
    if [ ! -d ${subName[i]} ]; then
        git clone ${subs[i]}
    fi
}&
done
wait

