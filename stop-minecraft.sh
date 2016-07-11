#/bin/bash
SCREENNAME='minecraft'

screen -S $SCREENNAME -X stuff '/stop'$(echo -ne '\015')
sleep 5
screen -S $SCREENNAME -X quit
