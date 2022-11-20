#!/bin/bash

sub1='https://github.com/793338023/sub-vue.git'
sub2='https://github.com/793338023/sub-react.git'
sub3='https://github.com/793338023/sub-html.git'

if [ ! -d sub-vue ]; then
git clone $sub1
fi

if [ ! -d sub-react ]; then
git clone $sub2
fi

if [ ! -d sub-html ]; then
git clone $sub3
fi


