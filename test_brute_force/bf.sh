#!/bin/bash
chars=' abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ0123456789'


# printf '%s' $1 | md5sum
# echo "arg is =$1="

for i in {0..60}
do
    for j in {0..60}
	do
		for k in {0..60}
		do
			for l in {0..60}
			do
				echo -ne "5chars $i/60 4chars $j/60 3chars $k/60 2chars $l/60\r"
				for m in {0..60}
				do
					str=$(echo "${chars:i:1}${chars:j:1}${chars:k:1}${chars:l:1}${chars:m:1}" | xargs)
					md=$(printf '%s' $str | md5sum | awk '{ print $1 }')
					# echo "md for =$str= is =$md="
					if [ "$1" = "$md" ]; then
    					echo "result is:$str"
						echo "result is:$str" > result.txt
						exit
					fi
				done
			done
		done
	done
done





# $ words="abc"
# $ echo ${words:0:1}
# a
# $ echo ${words:1:1}
# b
# $ echo ${words:2:1}
# c