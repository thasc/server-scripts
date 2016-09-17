#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

if [[ -a server.pid ]]
then
        ps cax | grep DreamDaemon | grep $(cat server.pid) > /dev/null
        if [[ $? != 0 ]]
        then
                echo "Server is not running."
                exit 1
        else
                echo "Stopping server with PID $(cat server.pid)."
                kill -9 $(cat server.pid)
                rm server.pid
                exit 0
        fi
else
        echo "No server PID file; this is fine if there isn't already a server running."
        exit 2
fi

exit 3

