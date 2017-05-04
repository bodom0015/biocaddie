#!/bin/bash

if [ -z "$1" ]; then
   echo "./runfd.sh <topics> <collection>"
   exit 1;
fi
topics=$1

if [ -z "$2" ]; then
   echo "./runfd.sh <topics> <collection>"
   exit 1;
fi
col=$2

base=/data/bioCaddie

mkdir -p output/fdm/$col/$topics
find queries/fdm/$col/$topics -type f | while read file
do
    for mu in 100 500 1000 2500
    do
        fileName=`basename $file`
        echo "IndriRunQuery -index=$base/indexes/biocaddie_all -rule=method:dir,mu:$mu -trecFormat $file > output/fdm/$col/$topics/$fileName,dir-mu:$mu"
    done
done

#sdm/runqueries.sh short combined | parallel -j 20 bash -c "{}" &