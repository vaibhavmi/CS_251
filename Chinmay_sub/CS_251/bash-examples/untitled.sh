#!/bin/bash

regex1='^[0-9]*$'

echo $1

echo $regex1

variabl=`grep $regex1 $1`

echo $variabl