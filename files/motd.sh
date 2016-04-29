#!/usr/bin/env bash
# Inspired by https://gist.github.com/cha55son/6042560

RELEASE=`cat /etc/redhat-release 2>/dev/null|| cat /etc/lsb-release | grep DISTRIB_DESCRIPTION | cut -d '=' -f 2 | sed -s "s/^\(\(\"\(.*\)\"\)\|\('\(.*\)'\)\)\$/\\3\\5/g"`
USER=`whoami`
HOSTNAME=`uname -n`
MEMORY1=`free -t -m | grep "buff/cache" | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
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
- Mem usage:
`free -t -mh`
===========================================================================
- Disk usage:
`df -h | grep --invert '^none\|tmpfs\|udev'`
===========================================================================
"
