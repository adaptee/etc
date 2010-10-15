#!/bin/bash
# when mouse is plugged out, enable touchpad

LOGFILE="/var/log/mouse-plugging.log"


echo "$(date '+%F %T' ): mouse is plugged out" >> ${LOGFILE}

# NOTE, synclient requires access to X server ;
# yet, this script will be automaticaly invoked with root identity
# so, we need to make root know about X server ($DISPLAY)
#
# Besides, root should  be granted the access permission by the ownser
# of X server, which can be done through "xhost +local:root" by
# the owner( not root!)
#
#

#su whodare -c "env DISPLAY=:0 /usr/bin/synclient TouchpadOff=0"
export DISPLAY=:0
/usr/bin/synclient TouchpadOff=0

echo "execution result: $?" >> ${LOGFILE}
