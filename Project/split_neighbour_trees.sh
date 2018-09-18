#!/bin/bash

for i in {1..288}
do
head -i true_tree_neighbours>>neighbour$((i))
done
