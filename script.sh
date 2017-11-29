#!/bin/bash

num_cpu=8
inputs=(500.txt 2000.txt)
benchmarks=(hashmark-local.arm hashmark-global.arm hashmark-nolocks.arm)

for benchmark in "${benchmarks[@]}"; do
	echo "--------------- $benchmark -----------------------"
	for input in "${inputs[@]}"; do
		echo "-------------------- $input -----------------------"
		# change this to match your file system
		nice build/ARM/gem5.opt -d ./output/ configs/c429/armA15.py $num_cpu \
		-c configs/c429/hashmark/$benchmark \
		-o "$num_cpu configs/c429/$input"

		# change this part to match your file system
		mv output/stats.txt ~/Documents/429_a4/output/stat_${benchmark}_${input}_${num_cpu}.txt
	done
done
