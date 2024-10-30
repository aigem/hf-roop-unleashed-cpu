#!/bin/sh

# 在后台运行 run.py, 并输出日志到 $HOMEDIR/app/run.log
python $HOMEDIR/app/run.py > $HOMEDIR/app/run.log 2>&1 &

