#!/bin/bash

#n=4760
for i in {1..4760}
do
#a=`expr 2 \* $i`
#echo $a
head -n $i mammal_neighbor| tail -n 1 >n$((i))
done
