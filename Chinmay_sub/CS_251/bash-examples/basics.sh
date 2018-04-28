# !/bin/bash

 read a
 c=10
 read b
 echo $a $b $c
 
 # read a b < infile
 # echo "a=$a b=$b"
 # echo "a=$a b=$b" > outfile
 # echo "a=$a b=$b" >> outfile
 
 # a=ls
 # echo $a
 # a="ls"
 # echo $a
 # a='ls'
 # echo $a
 # a=$(ls)
 # echo $a
 # a=`ls`
 # echo $a
# #
# ls ~/Downloads/bash-examples/*.txt | grep vai
# ls ~/Downloads/bash-examples/*.txt | grep bash | wc
# numfiles_vai=`ls ~/Downloads/bash-examples/*.txt | grep vai | wc -l`
# numfiles_mo=`ls ~/Downloads/bash-examples/*.txt | grep bash | wc -l`
# total=$(($numfiles_vai + $numfiles_mo))
# echo "numfiles_vai=$numfiles_vai numfiles_mo=$numfiles_mo total=$total"
 
 # ls ~/Downloads/bash-examples/*.txt | grep -E 'hw|cpu' | wc -l  
