DATE=`date +%Y%m%d-%H%M%S`
SCREENNAME='minecraft'

P1NAME='minesecedu_p1' # red
P2NAME='minesecedu_p2' # yellow
P3NAME='minesecedu_p3' # green
P4NAME='minesecedu_p4' # blue

# require an argument in $1 to select player to give sword
if [ -z $1 ] ; then
        echo 'give-sword.sh requires a player name to revive!'
        exit 1
fi

echo 'Adding sword player '$1' in 5 seconds...'
screen -S $SCREENNAME -X stuff '/say Adding sword player '$1' in 5 seconds...'$(echo -ne '\015')
sleep 5

#Teleport player to their base:
if [ "$1" = "$P1NAME" ] ; then
	screen -S $SCREENNAME -X stuff '/give '$P1NAME' diamond_sword 1 0'$(echo -ne '\015') # red
elif [ "$1" = "$P2NAME" ] ; then
	screen -S $SCREENNAME -X stuff '/give '$P2NAME' diamond_sword 1 0'$(echo -ne '\015') # yellow
elif [ "$1" = "$P3NAME" ] ; then	
	screen -S $SCREENNAME -X stuff '/give '$P3NAME' diamond_sword 1 0'$(echo -ne '\015') # green
elif [ "$1" = "$P4NAME" ] ; then
	screen -S $SCREENNAME -X stuff '/give '$P4NAME' diamond_sword 1 0'$(echo -ne '\015') # blue
fi
