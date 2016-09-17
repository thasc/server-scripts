#!/bin/bash
AFFINITY=6 #core - 1

cd "$( dirname "${BASH_SOURCE[0]}" )"

if [ -a server.pid ]
then
        ps cax | grep DreamDaemon | grep $(cat server.pid) > /dev/null
        if [[ $? == 0 ]]
        then
                echo "Server is already running."
                exit 1
        fi
fi
source ../sourcebyond.sh
ulimit -n 2000
jobs
LIBC_FATAL_STDERR_=1 DreamDaemon baystation12.dmb 8000 -trusted -core -invisible -webclient -verbose 2>&1 | ./tsout.sh & disown -ar
jobs
pgrep DreamDaemon -n > server.pid
taskset -c -p $AFFINITY $(cat server.pid)
echo "Server started with PID $(cat server.pid)."
disown -a
exit 0
