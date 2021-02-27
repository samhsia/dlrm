#!/bin/bash

DIR="/data/terabyte"

# Setup directories
rm -rf $DIR
mkdir -p $DIR

cd $DIR

# Download Criteo Terabyte Dataset
for i in {0..23}
do
    echo "Downloading Day $i"
    wget http://azuremlsampleexperiments.blob.core.windows.net/criteo/day_$i.gz
    echo "Finished Downloading Day $i"
done

# Unzip Criteo Terabyte Dataset
for i in {0..23}
do
    echo "Unzipping Day $i"
    gunzip day_$i.gz
    echo "Finished Unzipping Day $i"
done
