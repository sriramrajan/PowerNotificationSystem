#!/bin/bash
#AppleScript borrowed from https://discussions.apple.com/thread/5077940?tstart=0
#Shell script modified from http://apple.stackexchange.com/questions/53111/run-a-shell-script-when-switching-to-battery-power
var=0
while [ $var -eq 0 ]
do
  AC_POWER=`ioreg -l | grep ExternalConnected | cut -d"=" -f2 | sed -e 's/ //g'`

  if [[ "$AC_POWER" == "Yes" ]]
  then
    osascript -e 'tell application "Messages" to send "Hello! Power is back" to buddy "Sriram Rajan"'
    if [ $? -eq 0 ] #Maybe wifi connection will resolve in 10 min
    then
      break
    fi
  fi
  sleep 600
done
