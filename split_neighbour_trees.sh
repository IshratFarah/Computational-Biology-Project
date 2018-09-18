#!/bin/bash

n=wc -l mammal_neighbor
for i in {1..n/2}
do
head -2*i mammal_neighbor|tail -2>>n$((i))
done
