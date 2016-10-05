#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S`
MCPATH=$HOME'/minecraft-vuln-mgt'
WORLDNAME='minecraft-vuln-mgt'
SCREENNAME='minecraft'

# broadcast message that we are backing up the world
echo $DATE' backing up world '$WORLDNAME
screen -S $SCREENNAME -X stuff '/say '$DATE' backing up world '$WORLDNAME$(echo -ne '\015')

# force save and backup world files (sleep to make sure save completes)
screen -S $SCREENNAME -X stuff '/save-off'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/save-all'$(echo -ne '\015')
sleep 5
tar -C $MCPATH -czf $WORLDNAME'-'$DATE'.tgz' $WORLDNAME

#restore auto-saving
screen -S $SCREENNAME -X stuff '/save-on'$(echo -ne '\015')
