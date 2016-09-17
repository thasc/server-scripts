#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
./stop.sh
sleep 2
./start.sh

