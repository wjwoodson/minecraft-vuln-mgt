#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S`
MCPATH=$HOME'/minecraft'
WORLDNAME='minecraft-vuln-mgt'
SCREENNAME='minecraft'

# Restore from backup
./restore-world.sh
sleep 30
echo 'Login players now.'
sleep 90

#Teleport players to starting zone
echo 'Teleporting players to starting zone...'

# Countdown to game start
echo 'Minecraft Vulnerability Management'
echo 'The game will start in 60 seconds.'
screen -S $SCREENNAME -X stuff '/say Minecraft Vulnerability Management'$(echo -ne '\015')
screen -S $SCREENNAME -X stuff '/say The game will start in 60 seconds.'$(echo -ne '\015')
sleep 30
screen -S $SCREENNAME -X stuff '/say The game will start in 30 seconds...'$(echo -ne '\015')
sleep 20
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
echo 'Game beginning. You have 3 minutes to prepare your defensive perimeter.'
screen -S $SCREENNAME -X stuff '/say Game beginning. You have 3 minutes to prepare your defensive perimeter.'$(echo -ne '\015')

# Open gates to start the game
screen -S $SCREENNAME -X stuff '/fill 222 4 217 244 8 239 air 0 replace stonebrick 2'$(echo -ne '\015')

# Wait until players clear the spawn zone
sleep 120
# Seal bases
screen -S $SCREENNAME -X stuff '/fill 178 4 227 182 7 229 stonebrick 0 replace air 0'$(echo -ne '\015') # red
# yellow
# green
# blue

# Countdown for preparations
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
screen -S $SCREENNAME -X stuff '/fill 143 4 210 161 8 246 air 0 replace stonebrick 2'$(echo -ne '\015') #red
# yellow
# green
# blue
for i in {1..6}; do
	# red
	screen -S $SCREENNAME -X stuff '/summon Zombie 149 4 211'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/summon Zombie 159 4 228'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/summon Zombie 144 4 226'$(echo -ne '\015')
	screen -S $SCREENNAME -X stuff '/summon Zombie 149 4 245'$(echo -ne '\015')
	# yellow
	# green
	# blue
done
sleep 120

# Begin stage 2. Alert that cyber threat intel is available.
screen -S $SCREENNAME -X stuff '/fill 143 0 210 161 4 246 air 0 replace stonebrick 2'$(echo -ne '\015') #red
# yellow
# green
# blue
for i in {1..4}; do
        # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 151 1 234'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 154 1 219'$(echo -ne '\015')
        # yellow
        # green
        # blue
done
echo 'Cyber threat intelligence is now available.'
screen -S $SCREENNAME -X stuff '/say Cyber threat intelligence is now available.'$(echo -ne '\015')
sleep 60

# Begin stage 3
screen -S $SCREENNAME -X stuff '/fill 162 4 228 177 8 246 air 0 replace stonebrick 2'$(echo -ne '\015') #red
# yellow
# green
# blue
for i in {1..2}; do
        # red
        screen -S $SCREENNAME -X stuff '/summon Zombie 161 4 228'$(echo -ne '\015')
        screen -S $SCREENNAME -X stuff '/summon Zombie 163 4 245'$(echo -ne '\015')
        # yellow
        # green
        # blue
done
for i in {1..6}; do
        screen -S $SCREENNAME -X stuff '/summon Zombie 176 4 245'$(echo -ne '\015') #red
        # yellow
        # green
        # blue
done
sleep 120

# Begin stage 4
screen -S $SCREENNAME -X stuff '/fill 162 4 210 177 8 227 air 0 replace stonebrick 2'$(echo -ne '\015') #red
# yellow
# green
# blue
for i in {1..2}; do
	screen -S $SCREENNAME -X stuff '/summon Zombie 163 4 211'$(echo -ne '\015') #red
        # yellow
        # green
        # blue
done
for i in {1..6}; do
        screen -S $SCREENNAME -X stuff '/summon Zombie 176 4 211'$(echo -ne '\015') #red
        # yellow
        # green
        # blue
done
sleep 60

# Countdown for end of game
screen -S $SCREENNAME -X stuff '/say 60 seconds remaining in game...'$(echo -ne '\015')
sleep 30
screen -S $SCREENNAME -X stuff '/say 30 seconds remaining in game...'$(echo -ne '\015')
sleep 20
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
echo 'Game completed!'
screen -S $SCREENNAME -X stuff '/say Game completed!'$(echo -ne '\015')

# total scores 
# report results

