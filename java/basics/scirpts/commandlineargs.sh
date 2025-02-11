#!/bin/bash

array=( $(seq 1 $1 ) )
echo "CLA.java" ${array[@]}
java CLA.java ${array[@]} 
