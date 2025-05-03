#!/bin/bash

for i in $(seq 1 30);do
{
if((( $i % 5 == 0 ||  $i % 3 == 0)) && (( $i % 15 != 0 )))
then echo "$i\n"
fi
}
done
