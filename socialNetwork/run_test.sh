#!/bin/bash
#../wrk2/wrk -D exp -t 10 -c 10 -d 180 -L -s ./wrk2/scripts/social-network/mixed-workload.lua http://10.42.1.123:8080/wrk2-api/user-timeline/read -R 1000
rate=$4
array=($rate)
ip=$1
outdir=$2
numtrials=$3

mkdir -p $outdir/tmp
for ((trial=0;trial<$numtrials;trial++))
do
	for rate in "${array[@]}"
	do
		echo "run test with " $rate
		../wrk2/wrk -D exp -t 25 -c 25 -d 180 -L -s ./wrk2/scripts/social-network/mixed-workload.lua http://$ip:8080/wrk2-api/user-timeline/read -R $rate -P
		for ((i=0;i<25;i++)) 
		do
			mv  $i.txt $outdir/tmp/
		done
		cat $outdir/tmp/*.txt >  $outdir/tmp/t10_c10_r${rate}_mixed_$trial.txt
		mv $outdir/tmp/t10_c10_r${rate}_mixed_$trial.txt $outdir/
		rm $outdir/tmp/*.txt
	done
done
