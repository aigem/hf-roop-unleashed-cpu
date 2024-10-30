#!/bin/sh

# 在后台运行 run.py
python $HOMEDIR/app/run.py > $HOMEDIR/app/run.log 2>&1 &

