#!/bin/bash

interval=""
user=""
pass=""
logfile=""

if [ $# -eq 4 ]; then
    interval=$1
    user=-u$2
    pass=-p$3
    logfile=$4
else
    interval=$1
    user=-u$2
    logfile=$3
fi

watch -n $interval "date +'%Y/%m/%d %H:%M:%S' >> $logfile; mysql $user $pass -e 'show processlist' 2>&1 | tee -a $logfile; echo >> $logfile"

