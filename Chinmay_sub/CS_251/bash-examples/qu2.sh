#!/bin/bash

function flag()
{
	local start="$i"
	local tr1=0
	local tr2=0
	if [[ -d "$1" ]];
		then 
		indent=$(("$indent"+1))
		local var=`ls -d -1 "$1"/**`
		IFS=$'\n'
		for word in "$var"
		do
			flag "$word"
		done
		indent=$(("$indent"-1))
	elif [[ -f "$1" ]]; 
		then
		file_process "$1"
		return 0
	fi
	local count="$indent"
	while [ "$count" -gt 0 ];
	do
		echo -e -n ' \t'
		((count--))
	done
	while [ "$start" -lt "$i" ];
	do
		tr1=$(($tr1 + ${ans1[start]}))
		tr2=$(($tr2 + ${ans2[start]}))
		((start++))
	done
	echo -n "(D) "
	local file_name=`basename "$1"`
	echo -n "$file_name"
	echo -n "-"
	echo -n $tr1
	echo -n "-"
	echo $tr2
}

function file_process()
{
	local words=`cat "$1"`
	regex1='^[.?!]$'
	local vaibhav=`cat "$1" | wc -l`
	local sum=0
	regex='^[0-9]*$'
	for word in $words
	do
		if [[ $word =~ $regex ]];
		then
			sum=$(($sum+1))
		fi
	done
	local count=$indent
	while [ $count -gt 0 ];
	do
		echo -e -n ' \t'
		count=$(($count-1))
	done
	echo -n "(F) "
	local file_name=`basename $1`
	echo -n $file_name
	echo -n "-"
	ans1[$i]=$((${ans1[$i]}+$vaibhav))
	echo -n $vaibhav
	echo -n "-"
	ans2[$i]=$((${ans2[$i]} + $sum))
	echo $sum
	((i++))
}

indent=0
ans1=()
ans2=()
i=0

var=`ls -d -1 "$1"/**`
IFS=$'\n'
for word in $var
do
	flag "$word"
done

start=0
((indent++))
while [ "$start" -lt "$i" ];
do
	tr1=$(($tr1 + ${ans1[start]}))
	tr2=$(($tr2 + ${ans2[start]}))
	((start++))
done
echo -n "(D) "
file_name=`basename $1`
echo -n $file_name
echo -n "-"
echo -n $tr1
echo -n "-"
echo -n $tr2
echo -e "\n"
