#!/bin/bash

#1.

#count=10

#if [ $count -eq 10 ]

#then

# echo "true"

#else

# echo "false"

#fi

#2. 

#value="guessme"

#guess=$1

#if [ "$value" = "$guess" ]

#then
#	echo "they are equal"
#else
#	echo "they are not equal"
#fi

#3.


filename=$1

if [ -f "$filename" ] && [ -w "$filename" ]
then 
	echo "hello ho gya " > $filename
else
	touch "$filename"
	echo "hello nhi hua" > "$filename"
fi
