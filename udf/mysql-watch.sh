#!/bin/bash

interval=$1
user=$2
pass=$3
logfile=$4

watch -n $interval "date +'%Y/%m/%d %H:%M:%S' >> $logfile; mysql -u$user -p$pass -e 'show processlist' | tee -a $logfile; echo >> $logfile"

