#!/bin/bash

inputs=(500.txt 2000.txt)
benchmarks=(hashmark-local.arm hashmark-global.arm hashmark-nolocks.arm)

for benchmark in "${benchmarks[@]}"; do
	echo "$benchmark"
	for input in "${inputs[@]}"; do
		echo "$input"
		nice build/ARM/gem5.opt -d ./output/ configs/c429/armA15.py -c \
		~/gem5/configs/c429/hashmark/$benchmark -o \
		"8 ~/gem5/configs/c429/$input"
	done
done
