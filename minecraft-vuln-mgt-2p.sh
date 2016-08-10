#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S`
MCPATH=$HOME'/minecraft'
WORLDNAME='minecraft-vuln-mgt'
SCREENNAME='minecraft'
SAVEPOINT='20160711-003911'

P1NAME='minesecedu_p1' # red
P2NAME='minesecedu_p2' # yellow

P1SCORE=0 # red
P2SCORE=0 # yellow
P1INTEL=0 # red
P2INTEL=0 # yellow

# Restore from backup
./restore-world.sh $SAVEPOINT
sleep 15
echo 'Login players now. (60 seconds to teleport)'
sleep 60

#Teleport players to starting zone
screen -S $SCREENNAME -X stuff '/tp '$P1NAME' 233 4 228'$(echo -ne '\015') # red
screen -S $SCREENNAME -X stuff '/tp '$P2NAME' 233 4 228'$(echo -ne '\015') # yellow
echo 'Teleporting players to starting zone...'
screen -S $SCREENNAME -X stuff '/say Teleporting players to starting zone...'$(echo -ne '\015')

# Countdown to game start
echo '!!! Minecraft Network Defense !!!'
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
echo 'Teleporting players to starting zone once more...'
screen -S $SCREENNAME -X stuff '/say Teleporting players to starting zone once more...'$(echo -ne '\015')

echo 'Game beginning. You have 3 minutes to prepare your defensive perimeter.'
screen -S $SCREENNAME -X stuff '/say Game beginning. You have 3 minutes to prepare your defensive perimeter.'$(echo -ne '\015')

# Open gates to start the game
screen -S $SCREENNAME -X stuff '/fill 222 4 217 244 8 239 air 0 replace stonebrick 2'$(echo -ne '\015')

# Wait until players clear the spawn zone
sleep 120
# Seal bases
screen -S $SCREENNAME -X stuff '/fill 178 4 227 182 7 229 stonebrick 0 replace air 0'$(echo -ne '\015') # red
screen -S $SCREENNAME -X stuff '/fill 232 4 280 234 7 283 stonebrick 0 replace air 0'$(echo -ne '\015') # yellow

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

# Begin stage 1
screen -S $SCREENNAME -X stuff '/fill 143 4 210 161 8 246 air 0 replace stonebrick 2'$(echo -ne '\015') # red
screen -S $SCREENNAME -X stuff '/fill 215 4 300 251 8 318 air 0 replace stonebrick 2'$(echo -ne '\015') # yellow
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
done
# poll for 2 minutes
for i in {1..12}; do
	# red
	P1DATE=`date +%H:%M:%S`
	screen -S $SCREENNAME -X stuff '/testfor @e[167,4,236,5,type=Zombie]'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/testfor @e[167,4,228,5,type=Zombie]'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/testfor @e[167,4,220,5,type=Zombie]'$(echo -ne '\015')
	sleep 1
	screen -S minecraft -X hardcopy $MCPATH'/count'
	sleep 1
	SCORE=`grep $P1DATE $MCPATH'/count' | grep -c 'Found Zombie'`
	P1SCORE=$((P1SCORE + 10 - SCORE))
	# yellow
	P2DATE=`date +%H:%M:%S`
	screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
	sleep 1
        screen -S minecraft -X hardcopy $MCPATH'/count'
        sleep 1
        SCORE=`grep $P2DATE $MCPATH'/count' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
	sleep 6
done


# Begin stage 2. Alert that cyber threat intel is available.
screen -S $SCREENNAME -X stuff '/fill 143 0 210 161 4 246 air 0 replace stonebrick 2'$(echo -ne '\015') # red
screen -S $SCREENNAME -X stuff '/fill 215 0 300 251 4 318 air 0 replace stonebrick 2'$(echo -ne '\015') # yellow
for i in {1..4}; do
        # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 151 1 234'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 154 1 219'$(echo -ne '\015')
        # yellow
	screen -S $SCREENNAME -X stuff '/summon Zombie 239 1 310'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 225 1 209'$(echo -ne '\015')
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
        screen -S minecraft -X hardcopy $MCPATH'/count'
        sleep 1
        SCORE=`grep $P1DATE $MCPATH'/count' | grep -c 'Found Zombie'`
        P1SCORE=$((P1SCORE + 10 - SCORE))
        # yellow
        P2DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
        screen -S minecraft -X hardcopy $MCPATH'/count'
        sleep 1
        SCORE=`grep $P2DATE $MCPATH'/count' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
        sleep 6
done

# Begin stage 3
screen -S $SCREENNAME -X stuff '/fill 162 4 228 177 8 246 air 0 replace stonebrick 2'$(echo -ne '\015') #red
screen -S $SCREENNAME -X stuff '/fill 233 4 284 251 8 299 air 0 replace stonebrick 2'$(echo -ne '\015') # yellow
for i in {1..2}; do
        # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 161 4 228'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 163 4 245'$(echo -ne '\015')
        # yellow
	screen -S $SCREENNAME -X stuff '/summon Zombie 233 4 300'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 250 4 298'$(echo -ne '\015')
done
for i in {1..6}; do
        screen -S $SCREENNAME -X stuff '/summon Zombie 176 4 245'$(echo -ne '\015') # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 249 4 287'$(echo -ne '\015') # yellow
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
        screen -S minecraft -X hardcopy $MCPATH'/count'
        sleep 1
        SCORE=`grep $P1DATE $MCPATH'/count' | grep -c 'Found Zombie'`
        P1SCORE=$((P1SCORE + 10 - SCORE))
        # yellow
        P2DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
        screen -S minecraft -X hardcopy $MCPATH'/count'
        sleep 1
        SCORE=`grep $P2DATE $MCPATH'/count' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
        sleep 6
done

# Begin stage 4
screen -S $SCREENNAME -X stuff '/fill 162 4 210 177 8 227 air 0 replace stonebrick 2'$(echo -ne '\015') #red
screen -S $SCREENNAME -X stuff '/fill 215 4 284 232 8 299 air 0 replace stonebrick 2'$(echo -ne '\015') # yellow
for i in {1..2}; do
	screen -S $SCREENNAME -X stuff '/summon Zombie 163 4 211'$(echo -ne '\015') # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 216 4 298'$(echo -ne '\015') # yellow
done
for i in {1..6}; do
        screen -S $SCREENNAME -X stuff '/summon Zombie 176 4 211'$(echo -ne '\015') # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 216 4 287'$(echo -ne '\015') # yellow
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
        screen -S minecraft -X hardcopy $MCPATH'/count'
        sleep 1
        SCORE=`grep $P1DATE $MCPATH'/count' | grep -c 'Found Zombie'`
        P1SCORE=$((P1SCORE + 10 - SCORE))
        # yellow
        P2DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
        screen -S minecraft -X hardcopy $MCPATH'/count'
        sleep 1
        SCORE=`grep $P2DATE $MCPATH'/count' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
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
        screen -S minecraft -X hardcopy $MCPATH'/count'
        sleep 1
        SCORE=`grep $P1DATE $MCPATH'/count' | grep -c 'Found Zombie'`
        P1SCORE=$((P1SCORE + 10 - SCORE))
        # yellow
        P2DATE=`date +%H:%M:%S`
        screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
        sleep 1
        screen -S minecraft -X hardcopy $MCPATH'/count'
        sleep 1
        SCORE=`grep $P2DATE $MCPATH'/count' | grep -c 'Found Zombie'`
        P2SCORE=$((P2SCORE + 10 - SCORE))
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
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
SCORE=`grep $P1DATE $MCPATH'/count' | grep -c 'Found Zombie'`
P1SCORE=$((P1SCORE + 10 - SCORE))
# yellow
P2DATE=`date +%H:%M:%S`
screen -S $SCREENNAME -X stuff '/testfor @e[225,4,294,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[233,4,294,5,type=Zombie]'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/testfor @e[242,4,294,5,type=Zombie]'$(echo -ne '\015')
sleep 1
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
SCORE=`grep $P2DATE $MCPATH'/count' | grep -c 'Found Zombie'`
P2SCORE=$((P2SCORE + 10 - SCORE))

# Add cyber threat intelligence bonuses
# If 1
C1DATE=`date +%H:%M:%S` 
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:1b}]}'$(echo -ne '\015')
sleep 1
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
P1BOOL=`grep $C1DATE $MCPATH'/count' | grep -c 'Found '$P1NAME`
P1INTEL=$((20 * P1BOOL))
P2BOOL=`grep $C1DATE $MCPATH'/count' | grep -c 'Found '$P2NAME`
P2INTEL=$((20 * P2BOOL))
# If 2
C2DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:2b}]}'$(echo -ne '\015')
sleep 1
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
P1BOOL=`grep $C2DATE $MCPATH'/count' | grep -c 'Found '$P1NAME`
P1INTEL=$((40 * P1BOOL))
P2BOOL=`grep $C2DATE $MCPATH'/count' | grep -c 'Found '$P2NAME`
P2INTEL=$((40 * P2BOOL))
# If 3
C3DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:3b}]}'$(echo -ne '\015')
sleep 1
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
P1BOOL=`grep $C3DATE $MCPATH'/count' | grep -c 'Found '$P1NAME`
P1INTEL=$((60 * P1BOOL))
P2BOOL=`grep $C3DATE $MCPATH'/count' | grep -c 'Found '$P2NAME`
P2INTEL=$((60 * P2BOOL))
# If 4
C4DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:4b}]}'$(echo -ne '\015')
sleep 1
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
P1BOOL=`grep $C4DATE $MCPATH'/count' | grep -c 'Found '$P1NAME`
P1INTEL=$((80 * P1BOOL))
P2BOOL=`grep $C4DATE $MCPATH'/count' | grep -c 'Found '$P2NAME`
P2INTEL=$((80 * P2BOOL))
# If 5
C5DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:5b}]}'$(echo -ne '\015')
sleep 1
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
P1BOOL=`grep $C5DATE $MCPATH'/count' | grep -c 'Found '$P1NAME`
P1INTEL=$((140 * P1BOOL))
P2BOOL=`grep $C5DATE $MCPATH'/count' | grep -c 'Found '$P2NAME`
P2INTEL=$((140 * P2BOOL))
# If 6
C6DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:6b}]}'$(echo -ne '\015')
sleep 1
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
P1BOOL=`grep $C6DATE $MCPATH'/count' | grep -c 'Found '$P1NAME`
P1INTEL=$((180 * P1BOOL))
P2BOOL=`grep $C6DATE $MCPATH'/count' | grep -c 'Found '$P2NAME`
P2INTEL=$((180 * P2BOOL))
# If 7
C7DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:7b}]}'$(echo -ne '\015')
sleep 1
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
P1BOOL=`grep $C7DATE $MCPATH'/count' | grep -c 'Found '$P1NAME`
P1INTEL=$((220 * P1BOOL))
P2BOOL=`grep $C7DATE $MCPATH'/count' | grep -c 'Found '$P2NAME`
P2INTEL=$((220 * P2BOOL))
# If 8
C8DATE=`date +%H:%M:%S`
screen -S minecraft -X stuff '/testfor @a {Inventory:[{id:"minecraft:wool",Damage:5s,Count:8b}]}'$(echo -ne '\015')
sleep 1
screen -S minecraft -X hardcopy $MCPATH'/count'
sleep 1
P1BOOL=`grep $C8DATE $MCPATH'/count' | grep -c 'Found '$P1NAME`
P1INTEL=$((300 * P1BOOL))
P2BOOL=`grep $C8DATE $MCPATH'/count' | grep -c 'Found '$P2NAME`
P2INTEL=$((300 * P2BOOL))

# Add intel score to total score
P1SCORE=$((P1SCORE + P1INTEL))
P2SCORE=$((P2SCORE + P2INTEL))

# Subtract death penalties
#P1SCORE=$((P1SCORE - P1DEATHS))
#P2SCORE=$((P2SCORE - P2DEATHS))

# report results
echo 'Final Results:'
screen -S $SCREENNAME -X stuff '/say Final Results:'$(echo -ne '\015')
echo $P1NAME' : '$P1SCORE' points ('$P1INTEL' threat intelligence)'
screen -S $SCREENNAME -X stuff '/say '$P1NAME' : '$P1SCORE' points ('$P1INTEL' threat intelligence)'$(echo -ne '\015')
echo $P2NAME' : '$P2SCORE' points ('$P2INTEL' threat intelligence)'
screen -S $SCREENNAME -X stuff '/say '$P2NAME' : '$P2SCORE' points ('$P2INTEL' threat intelligence)'$(echo -ne '\015')
