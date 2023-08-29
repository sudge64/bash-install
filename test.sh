#!/bin/bash

if [ $1 = "-u" ]
then
    echo "From test.sh : $(id -u -n)"
else
    echo "No argument"
fi

ARG=( "${@}" )

for i in ${ARG[@]}; do
    echo $i
done
