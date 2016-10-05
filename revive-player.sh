DATE=`date +%Y%m%d-%H%M%S`
SCREENNAME='minecraft'

P1NAME='minesecedu_p1' # red
P2NAME='minesecedu_p2' # yellow
P3NAME='minesecedu_p3' # green
P4NAME='minesecedu_p4' # blue

# require an argument in $1 to select player to revive
if [ -z $1 ] ; then
        echo 'revive-player.sh requires a player name to revive!'
        exit 1
fi


echo 'Reviving player '$1' in 10 seconds...'
screen -S $SCREENNAME -X stuff '/say Reviving player '$1' in 10 seconds...'$(echo -ne '\015')
sleep 10

#Teleport player to their base:
if [ "$1" = "$P1NAME" ] ; then
	screen -S $SCREENNAME -X stuff '/tp '$P1NAME' 176 4 228'$(echo -ne '\015') # red
#	export P1DEATHS=$((P1DEATHS + 100))
elif [ "$1" = "$P2NAME" ] ; then
	screen -S $SCREENNAME -X stuff '/tp '$P2NAME' 233 4 286'$(echo -ne '\015') # yellow
#	export P2DEATHS=$((P2DEATHS + 100))
elif [ "$1" = "$P3NAME" ] ; then	
	screen -S $SCREENNAME -X stuff '/tp '$P3NAME' 290 4 228'$(echo -ne '\015') # green
#	export P3DEATHS=$((P3DEATHS + 100))
elif [ "$1" = "$P4NAME" ] ; then
	screen -S $SCREENNAME -X stuff '/tp '$P4NAME' 233 4 170'$(echo -ne '\015') # blue
#	export P4DEATHS=$((P4DEATHS + 100))
fi

echo 'Teleported '$1' to appropriate base.'
screen -S $SCREENNAME -X stuff '/say Teleported '$1' to appropriate base.'$(echo -ne '\015')

