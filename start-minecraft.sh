#/bin/bash
MCPATH=$HOME'/minecraft'
JARFILE='minecraft_server.1.10.jar'
SCREENNAME='minecraft'

screen -S $SCREENNAME -d -m
screen -S $SCREENNAME -X stuff 'java -Xmx1024M -Xms1024M -jar '$MCPATH'/'$JARFILE' nogui'$(echo -ne '\015')
