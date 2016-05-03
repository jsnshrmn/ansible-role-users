#!/usr/bin/env bash
# Inspired by https://gist.github.com/cha55son/6042560

RELEASE=`cat /etc/system-release 2>/dev/null || cat /etc/redhat-release 2>/dev/null || cat /etc/lsb-release | grep DISTRIB_DESCRIPTION | cut -d '=' -f 2 | sed -s "s/^\(\(\"\(.*\)\"\)\|\('\(.*\)'\)\)\$/\\3\\5/g" 2>/dev/null`
USER=`whoami`
HOSTNAME=`uname -n`
PSA=`ps -Afl | wc -l`

#System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))

#System load
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`

#Mem Usage
MEM=`free -t -m`

#Disk Usage
DISK=`df -h | grep --invert '^none\|tmpfs\|udev'`

echo "===========================================================================
- Hostname............: $HOSTNAME
- Release.............: $RELEASE
- Users...............: Currently `users | wc -w` user(s) logged on
- Current user........: $USER
===========================================================================
- CPU usage...........: $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
- Processes...........: $PSA running
- System uptime.......: $upDays days $upHours hours $upMins minutes $upSecs seconds
===========================================================================
- Mem usage (MB):
$MEM
===========================================================================
- Disk usage:
$DISK
===========================================================================
"
