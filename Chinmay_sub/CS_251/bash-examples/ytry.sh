#!/bin/bash

var=`ls -d -1 "$1"/**`
IFS=$'\n'
for word in $var
do
	echo "$word"
done