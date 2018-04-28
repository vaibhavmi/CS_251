#!/bin/bash

function ist()
{
	a1=$1
	b1=$(($a1/1000))
	if [ "$b1" -ne 0 ];
	then
		scnd $b1	
		echo -n "thousand "
	fi	
	c1=$(($a1 % 1000))
	d1=$(($c1/100))
	if [ "$d1" -ne 0 ];
	then
		scnd $d1	
		echo -n "hundred "
	fi
	e1=$(($c1%100))
	thrd $e1
}

function scnd()
{
	declare -A scnd1=( ["1"]="one" ["2"]="two" ["3"]="three" 
		["4"]="four" ["5"]="five" ["6"]="six" ["7"]="seven"
		["8"]="eight" ["9"]="nine" );

	echo -n "${scnd1[$1]} ";
	return 0;
}

# function scnd()
# {
# 	a2=$1
# 	if [ "$a2" -eq 1 ];
# 	then
# 		echo -n "one "
# 	fi
# 	if [ "$a2" -eq 2 ];
# 	then
# 		echo -n "two "
# 	fi
# 	if [ "$a2" -eq 3 ];
# 	then
# 		echo -n "three "
# 	fi
# 	if [ "$a2" -eq 4 ];
# 	then
# 		echo -n "four "
# 	fi
# 	if [ "$a2" -eq 5 ];
# 	then
# 		echo -n "five "
# 	fi
# 	if [ "$a2" -eq 6 ];
# 	then
# 		echo -n "six "
# 	fi
# 	if [ "$a2" -eq 7 ];
# 	then
# 		echo -n "seven "
# 	fi
# 	if [ "$a2" -eq 8 ];
# 	then
# 		echo -n "eight "
# 	fi
# 	if [ "$a2" -eq 9 ];
# 	then
# 		echo -n "nine "
# 	fi
# 	return 0
# }

function thrd()
{
	b3=$1
	a3=$(($b3/10))
	c3=$(($b3%10))
	if [ "$a3" -eq 1 ];
	then
		forth $c3
		return 0
	fi
	if [ "$a3" -eq 2 ];
	then
		echo -n "twenty "
	fi
	if [ "$a3" -eq 3 ];
	then
		echo -n "thirty "
	fi
	if [ "$a3" -eq 4 ];
	then
		echo -n "forty "
	fi
	if [ "$a3" -eq 5 ];
	then
		echo -n "fifty "
	fi
	if [ "$a3" -eq 6 ];
	then
		echo -n "sixty "
	fi
	if [ "$a3" -eq 7 ];
	then
		echo -n "seventy "
	fi
	if [ "$a3" -eq 8 ];
	then
		echo -n "eighty "
	fi
	if [ "$a3" -eq 9 ];
	then
		echo -n "ninety "
	fi
	scnd $c3
	return 0
}

function forth()
{
	a4=$1
	if [ "$a4" -eq 0 ];
	then
		echo -n "ten "
	fi
	if [ "$a4" -eq 1 ];
	then
		echo -n "eleven "
	fi
	if [ "$a4" -eq 2 ];
	then
		echo -n "twelve "
	fi
	if [ "$a4" -eq 3 ];
	then
		echo -n "thirteen "
	fi
	if [ "$a4" -eq 4 ];
	then
		echo -n "fourteen "
	fi
	if [ "$a4" -eq 5 ];
	then
		echo -n "fifteen "
	fi
	if [ "$a4" -eq 6 ];
	then
		echo -n "sixteen "
	fi
	if [ "$a4" -eq 7 ];
	then
		echo -n "seventeen "
	fi
	if [ "$a4" -eq 8 ];
	then
		echo -n "eighteen "
	fi
	if [ "$a4" -eq 9 ];
	then
		echo -n "nineteen "
	fi
}

 read a

 regex='^[0-9]*$'
 if ! [[ $a =~ $regex ]];
 then
 	echo -n "invalid input"
 else
 	 max=99999999999
	 if [ "$a" -gt "$max" ];
	 	then
	 	echo -n "invalid input"
	 else

		# regex1='^[1-9][0-9]*$'

		#  regex='^[0-9]*$'

		#  if ! [[ $a =~ $regex1 ]];
		#  then
		#  	echo -n "invalid input"
		#  fi

		#  ans=${a#a*}

		#  new=${a##0+}

		# echo -n $new

		 if [ $a -eq 0 ];
		 then
		 	echo zero
		 else
		 	 new=$(echo $a | sed 's/^0*//')
			 
			 i1=$(($new/10000000))

			 if [ $i1 -ne 0 ];
			 then
			 	ist $i1
			 	echo -n "crore "
			 fi

			 i2=$(($new%10000000))

			 i3=$(($i2/100000))

			 if [ "$i3" -ne 0 ];
			 then
			 	thrd $i3
			 	echo -n "lakh "
			 fi

			 i4=$(($i2%100000))

			 i5=$(($i4/1000))

			 if [ "$i5" -ne 0 ];
			 then
			 	thrd $i5
			 	echo -n "thousand "
			 fi
			 
			 i6=$(($i4%1000))

			 i7=$(($i6/100))

			 if [ "$i7" -ne 0 ];
			 then
			 	scnd $i7
			 	echo -n "hundred "
			 fi

			 i8=$(($i6%100))

			 thrd $i8
		fi	 
		# #  echo -n `expr match "$a" '.*\(^[1-9][0-9]*$\)'`
	fi
fi