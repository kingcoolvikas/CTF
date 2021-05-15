#!/bin/bash

transport=('bus' 'car' 'bike' 'cycle')

echo "${transport[@]}"
#echo "${transport[3]}"

unset transport[1]

echo "${transport[@]}"

transport[1]='pata_nhi_bhai'

echo "${transport[@]}"
