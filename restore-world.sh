#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S`
MCPATH=$HOME'/minecraft'
WORLDNAME='minecraft-vuln-mgt'
SCREENNAME='minecraft'

BACKUPFILE=`ls -t $MCPATH'/'$WORLDNAME* | head -n1`
TSARG=$MCPATH'/'$WORLDNAME'-'$1'.tgz'

if [ $1 ] && [ -a $TSARG ] ; then
	BACKUPFILE=$TSARG	
fi

echo $DATE' restoring world from backup '$BACKUPFILE
screen -S $SCREENNAME -X stuff '/say '$DATE' restoring world from backup '$BACKUPFILE$(echo -ne '\015')
sleep 5

$MCPATH/stop-minecraft.sh
rm -rf $MCPATH'/'$WORLDNAME
tar -C $MCPATH -xzf $BACKUPFILE
$MCPATH/start-minecraft.sh
