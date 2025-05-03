#!/bin/bash

a=100
b=200
c=0

if(( $a > $b ))
then 
echo "$a is GOAT"
c=$a
else 
echo "$b is GOAT"
c=$b
fi


for i in $(seq 10 $c);
do echo $i;
done
