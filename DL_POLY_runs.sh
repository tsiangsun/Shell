#! /bin/bash
# This script is for perform multiple DL_POLY runs
# max is the number of runs
max=10
state="ex"
outfile="job-info.txt"
echo "Start on `date` " &> $outfile

for (( i = 0 ; i < $max ; i++ ))
do
    echo "Job $i start on `date`" >> $outfile 2>&1
    echo "Job $i start on `date`" 
    ./DLPOLY.X
    mv OUTPUT ../results/OUTPUT-$state$.$i
    mv CONFIG ../results/CONFIG-$state.$i
    mv REVOLD ../results/REVOLD-$state.$i
    mv STATIS ../results/STATIS-$state.$i
    mv HISTORY ../results/HISTORY-$state.$i
    mv RDFDAT ../results/RDFDAT-$state.$i
    cp REVCON ../results/REVCON-$state.$i
    cp REVIVE ../results/REVIVE-$state.$i
    mv REVCON CONFIG
    mv REVIVE REVOLD
    echo "Finished job $i of $max" >> $outfile 2>&1
done

echo "All jobs finished on `date`." >> $outfile 2>&1


