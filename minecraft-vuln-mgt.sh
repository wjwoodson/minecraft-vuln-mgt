#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S`
MCPATH=$HOME'/minecraft-vuln-mgt'
JARFILE='minecraft_server.1.10.jar'
WORLDNAME='minecraft-vuln-mgt'
SCREENNAME='minecraft'
SAVEPOINT='20160711-003911'

P1NAME='minesecedu_p1' # red
P2NAME='minesecedu_p2' # yellow
P3NAME='minesecedu_p3' # green
P4NAME='minesecedu_p4' # blue

P1SCORE=0 # red
P2SCORE=0 # yellow
P3SCORE=0 # green
P4SCORE=0 # blue
P1INTEL=0 # red
P2INTEL=0 # yellow
P3INTEL=0 # green
P4INTEL=0 # blue
P1DEATHS=0 # red
P2DEATHS=0 # yellow
P3DEATHS=0 # green
P4DEATHS=0 # blue

# Restore from backup
$MCPATH'/restore-world.sh' $SAVEPOINT $MCPATH $JARFILE
sleep 15
echo '!!! Minecraft Network Defense !!!'
echo 'Login players now. (60 seconds to teleport)'
sleep 60

# Teleport players to starting zone
screen -S $SCREENNAME -X stuff '/tp '$P1NAME' 233 4 228'$(echo -ne '\015') # red
screen -S $SCREENNAME -X stuff '/tp '$P2NAME' 233 4 228'$(echo -ne '\015') # yellow
screen -S $SCREENNAME -X stuff '/tp '$P3NAME' 233 4 228'$(echo -ne '\015') # green
screen -S $SCREENNAME -X stuff '/tp '$P4NAME' 233 4 228'$(echo -ne '\015') # blue
echo 'Teleporting players to starting zone...'
screen -S $SCREENNAME -X stuff '/say Teleporting players to starting zone...'$(echo -ne '\015')

# Countdown to game start
echo 'The game will start in 10 seconds.'
screen -S $SCREENNAME -X stuff '/say !!! Minecraft Network Defense !!!'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say The game will start in 10 seconds...'$(echo -ne '\015')
sleep 5
screen -S $SCREENNAME -X stuff '/say 5...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 4...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 3...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 2...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 1...'$(echo -ne '\015')
sleep 1

#Teleport players to starting zone
screen -S $SCREENNAME -X stuff '/tp '$P1NAME' 233 4 228'$(echo -ne '\015') # red
screen -S $SCREENNAME -X stuff '/tp '$P2NAME' 233 4 228'$(echo -ne '\015') # yellow
screen -S $SCREENNAME -X stuff '/tp '$P3NAME' 233 4 228'$(echo -ne '\015') # green
screen -S $SCREENNAME -X stuff '/tp '$P4NAME' 233 4 228'$(echo -ne '\015') # blue
echo 'Teleporting players to starting zone once more...'
screen -S $SCREENNAME -X stuff '/say Teleporting players to starting zone once more...'$(echo -ne '\015')

# 180 seconds from gate open until threat spawns begin
echo 'Game beginning. You have 3 minutes to prepare your defensive perimeter.'
screen -S $SCREENNAME -X stuff '/say Game beginning. You have 3 minutes to prepare your defensive perimeter.'$(echo -ne '\015')

# Open gates to start the game
screen -S $SCREENNAME -X stuff '/fill 222 4 217 244 8 239 air 0 replace stonebrick 2'$(echo -ne '\015')

# Wait until players clear the spawn zone
sleep 120
# Seal bases
screen -S $SCREENNAME -X stuff '/fill 178 4 227 182 7 229 stonebrick 0 replace air 0'$(echo -ne '\015') # red
screen -S $SCREENNAME -X stuff '/fill 232 4 280 234 7 283 stonebrick 0 replace air 0'$(echo -ne '\015') # yellow
screen -S $SCREENNAME -X stuff '/fill 284 4 227 288 7 229 stonebrick 0 replace air 0'$(echo -ne '\015') # green
screen -S $SCREENNAME -X stuff '/fill 232 4 173 234 7 176 stonebrick 0 replace air 0'$(echo -ne '\015') # blue

# Countdown for preparations
echo '60 seconds remaining to prepare defenses...'
screen -S $SCREENNAME -X stuff '/say 60 seconds remaining to prepare defenses...'$(echo -ne '\015')
sleep 30
screen -S $SCREENNAME -X stuff '/say 30 seconds remaining to prepare defenses...'$(echo -ne '\015')
sleep 20 
screen -S $SCREENNAME -X stuff '/say 10 seconds remaining to prepare defenses...'$(echo -ne '\015')
sleep 5
screen -S $SCREENNAME -X stuff '/say 5...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 4...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 3...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 2...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 1...'$(echo -ne '\015')
sleep 1
echo 'Cyber attacks beginning. Keep attackers outside of your defensive perimeter for 7 minutes.'
screen -S $SCREENNAME -X stuff '/say Cyber attacks beginning. Keep attackers outside of your defensive perimeter for 7 minutes.'$(echo -ne '\015')

# Begin stage 1 (120 seconds)
screen -S $SCREENNAME -X stuff '/fill 143 4 210 161 8 246 air 0 replace stonebrick 2'$(echo -ne '\015') # red
screen -S $SCREENNAME -X stuff '/fill 215 4 300 251 8 318 air 0 replace stonebrick 2'$(echo -ne '\015') # yellow
screen -S $SCREENNAME -X stuff '/fill 305 4 210 323 8 246 air 0 replace stonebrick 2'$(echo -ne '\015') # green
screen -S $SCREENNAME -X stuff '/fill 215 4 138 251 8 156 air 0 replace stonebrick 2'$(echo -ne '\015') # blue
for i in {1..6}; do
	# red
	screen -S $SCREENNAME -X stuff '/summon Zombie 149 4 211'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/summon Zombie 159 4 228'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/summon Zombie 144 4 226'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/summon Zombie 149 4 245'$(echo -ne '\015')
	# yellow
	screen -S $SCREENNAME -X stuff '/summon Zombie 233 4 302'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 216 4 312'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 233 4 317'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 250 4 312'$(echo -ne '\015')
	# green
	screen -S $SCREENNAME -X stuff '/summon Zombie 316 4 211'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 207 4 228'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 322 4 228'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 316 4 245'$(echo -ne '\015')
	# blue
	screen -S $SCREENNAME -X stuff '/summon Zombie 233 4 139'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 216 4 144'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 233 4 154'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 250 4 144'$(echo -ne '\015')
done
# poll for 120 minutes
for i in {1..12}; do
	# red
	P1DATE=`date +%H:%M:%S`
	screen -S $SCREENNAME -X stuff '/testfor @e[167,4,236,5,type=Zombie]'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/testfor @e[167,4,228,5,type=Zombie]'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/testfor @e[167,4,220,5,type=Zombie]'$(echo -ne '\015')
	sleep 1
	DEATHS=`grep -c "$P1NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P1DEATHS" ] ; then
                P1DEATHS=$(($P1DEATHS + 1))
                $MCPATH/revive-player.sh $P1NAME &
        fi
        SCORE=`grep $P1DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P1SCORE=$((P1SCORE + 10 - SCORE))
	# yellow
	P2DATE=`date +%H:%M:%S`
	screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
	sleep 1
	DEATHS=`grep -c "$P2NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P2DEATHS" ] ; then
                P2DEATHS=$(($P2DEATHS + 1))
                $MCPATH/revive-player.sh $P2NAME &
        fi
        SCORE=`grep $P2DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
	# green
	P3DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,236,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,228,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,220,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P3NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P3DEATHS" ] ; then
                P3DEATHS=$(($P3DEATHS + 1))
                $MCPATH/revive-player.sh $P3NAME &
        fi
        SCORE=`grep $P3DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P3SCORE=$((P3SCORE + 10 - SCORE))
	# blue
	P4DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,162,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P4NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P4DEATHS" ] ; then
                P4DEATHS=$(($P4DEATHS + 1))
                $MCPATH/revive-player.sh $P4NAME &
        fi
        SCORE=`grep $P4DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P4SCORE=$((P4SCORE + 10 - SCORE))
	sleep 6
done


# Begin stage 2 (60 seconds). Alert that cyber threat intel is available.
screen -S $SCREENNAME -X stuff '/fill 143 0 210 161 4 246 air 0 replace stonebrick 2'$(echo -ne '\015') # red
screen -S $SCREENNAME -X stuff '/fill 215 0 300 251 4 318 air 0 replace stonebrick 2'$(echo -ne '\015') # yellow
screen -S $SCREENNAME -X stuff '/fill 305 0 210 323 4 246 air 0 replace stonebrick 2'$(echo -ne '\015') # green
screen -S $SCREENNAME -X stuff '/fill 215 0 138 251 4 156 air 0 replace stonebrick 2'$(echo -ne '\015') # blue
for i in {1..4}; do
        # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 151 1 234'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 154 1 219'$(echo -ne '\015')
        # yellow
	screen -S $SCREENNAME -X stuff '/summon Zombie 239 1 310'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 225 1 209'$(echo -ne '\015')
        # green
	screen -S $SCREENNAME -X stuff '/summon Zombie 310 1 236'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 315 1 221'$(echo -ne '\015')
        # blue
	screen -S $SCREENNAME -X stuff '/summon Zombie 242 1 155'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 228 1 148'$(echo -ne '\015')
done
echo '5 minutes remaining in game...'
screen -S $SCREENNAME -X stuff '/say 5 minutes remaining in game...'$(echo -ne '\015')
sleep 1
echo 'Cyber threat intelligence is now available.'
screen -S $SCREENNAME -X stuff '/say Cyber threat intelligence is now available.'$(echo -ne '\015')

# poll for 60 seconds
for i in {1..6}; do
        # red
        P1DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,236,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,228,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,220,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P1NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P1DEATHS" ] ; then
                P1DEATHS=$(($P1DEATHS + 1))
                $MCPATH/revive-player.sh $P1NAME &
        fi
        SCORE=`grep $P1DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P1SCORE=$((P1SCORE + 10 - SCORE))
        # yellow
        P2DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P2NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P2DEATHS" ] ; then
                P2DEATHS=$(($P2DEATHS + 1))
                $MCPATH/revive-player.sh $P2NAME &
        fi
        SCORE=`grep $P2DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
        # green
        P3DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,236,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,228,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,220,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P3NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P3DEATHS" ] ; then
                P3DEATHS=$(($P3DEATHS + 1))
                $MCPATH/revive-player.sh $P3NAME &
        fi
        SCORE=`grep $P3DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P3SCORE=$((P3SCORE + 10 - SCORE))
        # blue
        P4DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,162,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P4NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P4DEATHS" ] ; then
                P4DEATHS=$(($P4DEATHS + 1))
                $MCPATH/revive-player.sh $P4NAME &
        fi
        SCORE=`grep $P4DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P4SCORE=$((P4SCORE + 10 - SCORE))
        sleep 6
done

# Begin stage 3 (120 seconds)
screen -S $SCREENNAME -X stuff '/fill 162 4 228 177 8 246 air 0 replace stonebrick 2'$(echo -ne '\015') #red
screen -S $SCREENNAME -X stuff '/fill 233 4 284 251 8 299 air 0 replace stonebrick 2'$(echo -ne '\015') # yellow
screen -S $SCREENNAME -X stuff '/fill 289 4 210 304 8 228 air 0 replace stonebrick 2'$(echo -ne '\015') # green
screen -S $SCREENNAME -X stuff '/fill 215 4 157 233 8 172 air 0 replace stonebrick 2'$(echo -ne '\015') # blue
for i in {1..2}; do
        # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 161 4 228'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 163 4 245'$(echo -ne '\015')
        # yellow
	screen -S $SCREENNAME -X stuff '/summon Zombie 233 4 300'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 250 4 298'$(echo -ne '\015')
        # green
	screen -S $SCREENNAME -X stuff '/summon Zombie 303 4 211'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 305 4 228'$(echo -ne '\015')
        # blue
	screen -S $SCREENNAME -X stuff '/summon Zombie 216 4 158'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 233 4 158'$(echo -ne '\015')
done
for i in {1..6}; do
        screen -S $SCREENNAME -X stuff '/summon Zombie 176 4 245'$(echo -ne '\015') # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 249 4 287'$(echo -ne '\015') # yellow
        screen -S $SCREENNAME -X stuff '/summon Zombie 291 4 211'$(echo -ne '\015') # green
        screen -S $SCREENNAME -X stuff '/summon Zombie 216 4 171'$(echo -ne '\015') # blue
done
echo '4 minutes remaining in game...'
screen -S $SCREENNAME -X stuff '/say 4 minutes remaining in game...'$(echo -ne '\015')

# poll for 2 minutes
for i in {1..12}; do
        # red
        P1DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,236,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,228,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,220,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P1NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P1DEATHS" ] ; then
                P1DEATHS=$(($P1DEATHS + 1))
                $MCPATH/revive-player.sh $P1NAME &
        fi
        SCORE=`grep $P1DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P1SCORE=$((P1SCORE + 10 - SCORE))
        # yellow
        P2DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P2NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P2DEATHS" ] ; then
                P2DEATHS=$(($P2DEATHS + 1))
                $MCPATH/revive-player.sh $P2NAME &
        fi
        SCORE=`grep $P2DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
	# green
        P3DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,236,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,228,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,220,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P3NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P3DEATHS" ] ; then
                P3DEATHS=$(($P3DEATHS + 1))
                $MCPATH/revive-player.sh $P3NAME &
        fi
        SCORE=`grep $P3DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P3SCORE=$((P3SCORE + 10 - SCORE))
        # blue
        P4DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,162,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P4NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P4DEATHS" ] ; then
                P4DEATHS=$(($P4DEATHS + 1))
                $MCPATH/revive-player.sh $P4NAME &
        fi
        SCORE=`grep $P4DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P4SCORE=$((P4SCORE + 10 - SCORE))
        sleep 6
done

# Begin stage 4 (120 seconds)
screen -S $SCREENNAME -X stuff '/fill 162 4 210 177 8 227 air 0 replace stonebrick 2'$(echo -ne '\015') #red
screen -S $SCREENNAME -X stuff '/fill 215 4 284 232 8 299 air 0 replace stonebrick 2'$(echo -ne '\015') # yellow
screen -S $SCREENNAME -X stuff '/fill 289 4 229 304 8 246 air 0 replace stonebrick 2'$(echo -ne '\015') # green
screen -S $SCREENNAME -X stuff '/fill 234 4 157 351 8 172 air 0 replace stonebrick 2'$(echo -ne '\015') # blue
for i in {1..2}; do
	screen -S $SCREENNAME -X stuff '/summon Zombie 163 4 211'$(echo -ne '\015') # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 216 4 298'$(echo -ne '\015') # yellow
        screen -S $SCREENNAME -X stuff '/summon Zombie 303 4 245'$(echo -ne '\015') # green
        screen -S $SCREENNAME -X stuff '/summon Zombie 250 4 158'$(echo -ne '\015') # blue
done
for i in {1..6}; do
        screen -S $SCREENNAME -X stuff '/summon Zombie 176 4 211'$(echo -ne '\015') # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 216 4 287'$(echo -ne '\015') # yellow
        screen -S $SCREENNAME -X stuff '/summon Zombie 291 4 245'$(echo -ne '\015') # green
        screen -S $SCREENNAME -X stuff '/summon Zombie 249 4 171'$(echo -ne '\015') # blue
done
echo '2 minutes remaining in game...'
screen -S $SCREENNAME -X stuff '/say 2 minutes remaining in game...'$(echo -ne '\015')

# poll for 60 seconds
for i in {1..6}; do
        # red
        P1DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,236,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,228,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,220,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P1NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P1DEATHS" ] ; then
                P1DEATHS=$(($P1DEATHS + 1))
                $MCPATH/revive-player.sh $P1NAME &
        fi
        SCORE=`grep $P1DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P1SCORE=$((P1SCORE + 10 - SCORE))
        # yellow
        P2DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P2NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P2DEATHS" ] ; then
                P2DEATHS=$(($P2DEATHS + 1))
                $MCPATH/revive-player.sh $P2NAME &
        fi
        SCORE=`grep $P2DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
        # green
        P3DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,236,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,228,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,220,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P3NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P3DEATHS" ] ; then
                P3DEATHS=$(($P3DEATHS + 1))
                $MCPATH/revive-player.sh $P3NAME &
        fi
        SCORE=`grep $P3DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P3SCORE=$((P3SCORE + 10 - SCORE))
        # blue
        P4DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,162,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P4NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P4DEATHS" ] ; then
                P4DEATHS=$(($P4DEATHS + 1))
                $MCPATH/revive-player.sh $P4NAME &
        fi
        SCORE=`grep $P4DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P4SCORE=$((P4SCORE + 10 - SCORE))
        sleep 6
done

# poll for 50 seconds
screen -S $SCREENNAME -X stuff '/say 60 seconds remaining in game...'$(echo -ne '\015')
for i in {1..5}; do
        # red
        P1DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,236,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,228,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[167,4,220,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P1NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P1DEATHS" ] ; then
                P1DEATHS=$(($P1DEATHS + 1))
                $MCPATH/revive-player.sh $P1NAME &
        fi
        SCORE=`grep $P1DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P1SCORE=$((P1SCORE + 10 - SCORE))
        # yellow
        P2DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff 'i/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P2NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P2DEATHS" ] ; then
                P2DEATHS=$(($P2DEATHS + 1))
                $MCPATH/revive-player.sh $P2NAME &
        fi
        SCORE=`grep $P2DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
        # green
        P3DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,236,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,228,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[299,4,220,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P3NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P3DEATHS" ] ; then
                P3DEATHS=$(($P3DEATHS + 1))
                $MCPATH/revive-player.sh $P3NAME &
        fi
        SCORE=`grep $P3DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P3SCORE=$((P3SCORE + 10 - SCORE))
        # blue
        P4DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,162,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,162,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
	DEATHS=`grep -c "$P4NAME was slain by" $MCPATH'/logs/latest.log'`
        if [ "$DEATHS" -gt "$P4DEATHS" ] ; then
                P4DEATHS=$(($P4DEATHS + 1))
                $MCPATH/revive-player.sh $P4NAME &
        fi
        SCORE=`grep $P4DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
        P4SCORE=$((P4SCORE + 10 - SCORE))
        sleep 6
done

# Countdown for end of game
screen -S $SCREENNAME -X stuff '/say 10 seconds remaining in game...'$(echo -ne '\015')
sleep 5
screen -S $SCREENNAME -X stuff '/say 5...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 4...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 3...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 2...'$(echo -ne '\015')
sleep 1
screen -S $SCREENNAME -X stuff '/say 1...'$(echo -ne '\015')
sleep 1
echo 'Game completed! Getting final results...'
screen -S $SCREENNAME -X stuff '/say Game completed! Getting final results...'$(echo -ne '\015')

#Final poll        
# red
P1DATE=`date +%H:%M:%S`
screen -S $SCREENNAME -X stuff '/testfor @e[167,4,236,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[167,4,228,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[167,4,220,5,type=Zombie]'$(echo -ne '\015')
sleep 1
DEATHS=`grep -c "$P1NAME was slain by" $MCPATH'/logs/latest.log'`
if [ "$DEATHS" -gt "$P1DEATHS" ] ; then
        P1DEATHS=$(($P1DEATHS + 1))
        $MCPATH/revive-player.sh $P1NAME &
fi
SCORE=`grep $P1DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
P1SCORE=$((P1SCORE + 10 - SCORE))
# yellow
P2DATE=`date +%H:%M:%S`
screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
sleep 1
DEATHS=`grep -c "$P2NAME was slain by" $MCPATH'/logs/latest.log'`
if [ "$DEATHS" -gt "$P2DEATHS" ] ; then
        P2DEATHS=$(($P2DEATHS + 1))
        $MCPATH/revive-player.sh $P2NAME &
fi
SCORE=`grep $P2DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
P2SCORE=$((P2SCORE + 10 - SCORE))
# green
P3DATE=`date +%H:%M:%S`
screen -S $SCREENNAME -X stuff '/testfor @e[299,4,236,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[299,4,228,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[299,4,220,5,type=Zombie]'$(echo -ne '\015')
sleep 1
DEATHS=`grep -c "$P3NAME was slain by" $MCPATH'/logs/latest.log'`
if [ "$DEATHS" -gt "$P3DEATHS" ] ; then
        P3DEATHS=$(($P3DEATHS + 1))
        $MCPATH/revive-player.sh $P3NAME &
fi
SCORE=`grep $P3DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
P3SCORE=$((P3SCORE + 10 - SCORE))
# blue
P4DATE=`date +%H:%M:%S`
screen -S $SCREENNAME -X stuff '/testfor @e[225,4,162,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[233,4,162,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[242,4,162,5,type=Zombie]'$(echo -ne '\015')
sleep 1
DEATHS=`grep -c "$P4NAME was slain by" $MCPATH'/logs/latest.log'`
if [ "$DEATHS" -gt "$P4DEATHS" ] ; then
        P4DEATHS=$(($P4DEATHS + 1))
        $MCPATH/revive-player.sh $P4NAME &
fi
SCORE=`grep $P4DATE $MCPATH'/logs/latest.log' | grep -c 'Found Zombie'`
P4SCORE=$((P4SCORE + 10 - SCORE))

# Add cyber threat intelligence bonuses
echo 'Adding cyber threat intel bonuses...'
screen -S $SCREENNAME -X stuff '/say Adding cyber threat intel bonuses...'$(echo -ne '\015')
# If 1
C1DATE=`date +%H:%M:%S` 
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:1b}]}'$(echo -ne '\015')
sleep 1
SCORE=`grep $C1DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P1NAME`
P1INTEL=$((P1INTEL + 20 * SCORE))
SCORE=`grep $C1DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P2NAME`
P2INTEL=$((P2INTEL + 20 * SCORE))
SCORE=`grep $C1DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P3NAME`
P3INTEL=$((P3INTEL + 20 * SCORE))
SCORE=`grep $C1DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P4NAME`
P4INTEL=$((P4INTEL + 20 * SCORE))
# If 2
C2DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:2b}]}'$(echo -ne '\015')
sleep 1
SCORE=`grep $C2DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P1NAME`
P1INTEL=$((P1INTEL + 40 * SCORE))
SCORE=`grep $C2DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P2NAME`
P2INTEL=$((P2INTEL + 40 * SCORE))
SCORE=`grep $C2DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P3NAME`
P3INTEL=$((P3INTEL + 40 * SCORE))
SCORE=`grep $C2DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P4NAME`
P4INTEL=$((P4INTEL + 40 * SCORE))
# If 3
C3DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:3b}]}'$(echo -ne '\015')
sleep 1
SCORE=`grep $C3DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P1NAME`
P1INTEL=$((P1INTEL + 60 * SCORE))
SCORE=`grep $C3DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P2NAME`
P2INTEL=$((P2INTEL + 60 * SCORE))
SCORE=`grep $C3DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P3NAME`
P3INTEL=$((P3INTEL + 60 * SCORE))
SCORE=`grep $C3DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P4NAME`
P4INTEL=$((P4INTEL + 60 * SCORE))
# If 4
C4DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:4b}]}'$(echo -ne '\015')
sleep 1
SCORE=`grep $C4DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P1NAME`
P1INTEL=$((P1INTEL + 80 * SCORE))
SCORE=`grep $C4DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P2NAME`
P2INTEL=$((P2INTEL + 80 * SCORE))
SCORE=`grep $C4DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P3NAME`
P3INTEL=$((P3INTEL + 80 * SCORE))
SCORE=`grep $C4DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P4NAME`
P4INTEL=$((P4INTEL + 80 * SCORE))
# If 5
C5DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:5b}]}'$(echo -ne '\015')
sleep 1
SCORE=`grep $C5DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P1NAME`
P1INTEL=$((P1INTEL + 140 * SCORE))
SCORE=`grep $C5DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P2NAME`
P2INTEL=$((P2INTEL + 140 * SCORE))
SCORE=`grep $C5DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P3NAME`
P3INTEL=$((P3INTEL + 140 * SCORE))
SCORE=`grep $C5DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P4NAME`
P4INTEL=$((P4INTEL + 140 * SCORE))
# If 6
C6DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:6b}]}'$(echo -ne '\015')
sleep 1
SCORE=`grep $C6DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P1NAME`
P1INTEL=$((P1INTEL + 180 * SCORE))
SCORE=`grep $C6DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P2NAME`
P2INTEL=$((P2INTEL + 180 * SCORE))
SCORE=`grep $C6DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P3NAME`
P3INTEL=$((P3INTEL + 180 * SCORE))
SCORE=`grep $C6DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P4NAME`
P4INTEL=$((P4INTEL + 180 * SCORE))
# If 7
C7DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:7b}]}'$(echo -ne '\015')
sleep 1
SCORE=`grep $C7DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P1NAME`
P1INTEL=$((P1INTEL + 220 * SCORE))
SCORE=`grep $C7DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P2NAME`
P2INTEL=$((P2INTEL + 220 * SCORE))
SCORE=`grep $C7DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P3NAME`
P3INTEL=$((P3INTEL + 220 * SCORE))
SCORE=`grep $C7DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P4NAME`
P4INTEL=$((P4INTEL + 220 * SCORE))
# If 8
C8DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:8b}]}'$(echo -ne '\015')
sleep 1
SCORE=`grep $C8DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P1NAME`
P1INTEL=$((P1INTEL + 300 * SCORE))
SCORE=`grep $C8DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P2NAME`
P2INTEL=$((P2INTEL + 300 * SCORE))
SCORE=`grep $C8DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P3NAME`
P3INTEL=$((P3INTEL + 300 * SCORE))
SCORE=`grep $C8DATE $MCPATH'/logs/latest.log' | grep -c 'Found '$P4NAME`
P4INTEL=$((P4INTEL + 300 * SCORE))

# Add intel score to total score
P1SCORE=$((P1SCORE + P1INTEL))
P2SCORE=$((P2SCORE + P2INTEL))
P3SCORE=$((P3SCORE + P3INTEL))
P4SCORE=$((P4SCORE + P4INTEL))

# Subtract death penalties
P1SCORE=$((P1SCORE - P1DEATHS * 20))
P2SCORE=$((P2SCORE - P2DEATHS * 20))
P3SCORE=$((P3SCORE - P3DEATHS * 20))
P4SCORE=$((P4SCORE - P4DEATHS * 20))

# report results
echo 'Final Results:'
screen -S $SCREENNAME -X stuff '/say Final Results:'$(echo -ne '\015')
echo $P1NAME' : '$P1SCORE' points ('$P1INTEL' threat intelligence, '$P1DEATHS' deaths)'
screen -S $SCREENNAME -X stuff '/say '$P1NAME' : '$P1SCORE' points ('$P1INTEL' threat intelligence, '$P1DEATHS' deaths)'$(echo -ne '\015')
echo $P2NAME' : '$P2SCORE' points ('$P2INTEL' threat intelligence, '$P2DEATHS' deaths)'
screen -S $SCREENNAME -X stuff '/say '$P2NAME' : '$P2SCORE' points ('$P2INTEL' threat intelligence, '$P2DEATHS' deaths)'$(echo -ne '\015')
echo $P3NAME' : '$P3SCORE' points ('$P3INTEL' threat intelligence, '$P3DEATHS' deaths)'
screen -S $SCREENNAME -X stuff '/say '$P3NAME' : '$P3SCORE' points ('$P3INTEL' threat intelligence, '$P3DEATHS' deaths)'$(echo -ne '\015')
echo $P4NAME' : '$P4SCORE' points ('$P4INTEL' threat intelligence, '$P4DEATHS' deaths)'
screen -S $SCREENNAME -X stuff '/say '$P4NAME' : '$P4SCORE' points ('$P4INTEL' threat intelligence, '$P4DEATHS' deaths)'$(echo -ne '\015')
