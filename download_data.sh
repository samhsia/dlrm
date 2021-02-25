#!/bin/bash

DIR="/data/terabyte"

# Setup directories
mkdir -p $DIR
cd $DIR

# Download Criteo Terabyte Dataset
curl -O http://azuremlsampleexperiments.blob.core.windows.net/criteo/day_{`seq -s , 0 23`}.gz

# Unzip Criteo Terabyte Dataset
for i in {0..23}
do
	gunzip day_$i.gz
done
