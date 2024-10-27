#!/bin/env bash
set -x
./lib/iventoy
sleep 5
tail -f log/log.txt