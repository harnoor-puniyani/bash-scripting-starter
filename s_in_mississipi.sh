#!/bin/bash
count=0
str=mississipi

for i in $(seq 0 #str); do
echo $i
if (($(str:i:1) == 's' || $(str:i:1) == 'S'))
then ((count++))
fi
done
echo $count

