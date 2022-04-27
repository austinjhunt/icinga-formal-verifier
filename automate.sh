#!/bin/bash

# Script to automate the execution of nuXmv symbolic model checking against all component models (component/*/check.smv)
currpath=$(pwd)
for component in $(ls components/); do
    echo "Checking model for component $component";
    sleep 0.25;
    path="${currpath}/components/$component/check.smv";
    logpath="logs/${component}.log"
    ./nuxmv $path > $logpath
    echo "Results written to $logpath";
    echo ""; echo "";
    sleep 0.1
done
