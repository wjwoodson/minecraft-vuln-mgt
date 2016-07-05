#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S`
MCPATH=$HOME'/minecraft'
WORLDNAME='minecraft-vuln-mgt'
SCREENNAME='minecraft'

echo $DATE' restoring world from backup '$BACKUPFILE
screen -S $SCREENNAME -X stuff '/say '$DATE' restoring world from backup '$BACKUPFILE$(echo -ne '\015')

#echo $DATE' restoring world from backup '$BACKUPFILE
#screen -S $SCREENNAME -X stuff '/say '$DATE' restoring world from backup '$BACKUPFILE$(echo -ne '\015')
