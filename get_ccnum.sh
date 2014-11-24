#!/bin/bash

# $1 has to be a csv text file which includes cdinfo_serial,subscriber_id,number(encrypted cc number)
while read line
do
    card=$line
    IFS=","
    ARRAY=($card)
    /usr/bin/curl  -k -d "method=decrypt&subs_id=${ARRAY[0]}&cc_id=${ARRAY[1]}&cc_no=${ARRAY[2]}" https://192.168.2.5/dec_enc.php
    echo ""
done < $1 
