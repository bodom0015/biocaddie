#!/bin/bash

if [ -z "$1" ]; then
   echo "./two.sh <topics> <collection>"
   exit 1;
fi
topics=$1

if [ -z "$2" ]; then
   echo "./two.sh <topics> <collection>"
   exit 1;
fi
col=$2

base=/data/bioCaddie
mkdir -p output/two/$col/$topics
for mu in 100 250 500 750 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000
do
   for lambda in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 
   do
       IndriRunQuery -index=$base/indexes/biocaddie_all/ -trecFormat=true -rule=method:two,mu:$mu,lambda:$lambda $base/queries/queries.$col.$topics > output/two/$col/$topics/mu=$mu:lambda=$lambda.out
   done
done