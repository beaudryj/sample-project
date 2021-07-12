#!/bin/sh
set -e 

#Validating Status of network
status=$(litecoin-cli getnetworkinfo | jq .networkactive)
#Validating the Container is making some level of connectivity
connections=$(litecoin-cli -getinfo | jq .connections)

if [ "$status" = "true" ] && [ $connections -gt 0 ]; then 
    exit 0; 
else
    exit 1; 
fi



