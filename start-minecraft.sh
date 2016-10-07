#/bin/bash
MCPATH=$HOME'/minecraft-vuln-mgt/'
JARFILE='minecraft_server.1.10.jar'
MEMORY_ALLOC='2048M'
SCREENNAME='minecraft'

# use minecraft jar provided in $1, else use default
if [ $1 ] ; then
        JARFILE=$1
fi

# set MCPATH provided in $2, else use default
if [ $2 ] ; then
        MCPATH=$2
fi

# start minecraft in named screen
screen -S $SCREENNAME -d -m
screen -S $SCREENNAME -X stuff 'java -Xmx'$MEMORY_ALLOC' -Xms'$MEMORY_ALLOC' -jar '$MCPATH'/'$JARFILE' nogui'$(echo -ne '\015')
