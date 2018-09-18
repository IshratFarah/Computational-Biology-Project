#!/bin/bash

for i in {1..288}
do
head -$i output>>Astral_neighbour_$i
done
