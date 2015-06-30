#!/bin/bash
# This script is for perform multiple 1-processor runs
# max is the number of runs
jobname="harmonic-num"
max=10
min=1
state="test"
outfile="job-info-$state.txt"

echo "Start on `date` " &> $outfile

for (( i = $min ; i <= $max ; i++ ))
do
     sed "s/MYPROGRAM/$jobname/g" /export/geva/xiangs/sample/sample-serial.pbs > $jobname-$i.pbs
     sed "s/JOBINDEX/$i/g" -i $jobname-$i.pbs
     qsub ./$jobname-$i.pbs

     # ./$jobname $i
done

echo "All jobs submitted on `date`." >> $outfile 2>&1
exit

