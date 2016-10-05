#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S`
MCPATH=$HOME'/minecraft-vuln-mgt'
JARFILE='minecraft_server.1.10.jar'
WORLDNAME='minecraft-vuln-mgt'
SCREENNAME='minecraft'

BACKUPFILE=`ls -t $MCPATH'/'$WORLDNAME-*.tgz | head -n1`
TSARG=$MCPATH'/'$WORLDNAME'-'$1'.tgz'

# restore from timestamp provided in $1, else get most recent
if [ $1 ] && [ -a $TSARG ] ; then
	BACKUPFILE=$TSARG	
fi

# set MCPATH provided in $2, else use default
if [ $2 ] ; then
        MCPATH=$2
fi

echo $DATE' restoring world from backup '$BACKUPFILE
screen -S $SCREENNAME -X stuff '/say '$DATE' restoring world from backup '$BACKUPFILE$(echo -ne '\015')
sleep 5

# stop server, restore world, start server
$MCPATH/stop-minecraft.sh
sleep 5
rm -rf $MCPATH'/'$WORLDNAME
tar -C $MCPATH -xzf $BACKUPFILE
$MCPATH/start-minecraft.sh $JARFILE $MCPATH
