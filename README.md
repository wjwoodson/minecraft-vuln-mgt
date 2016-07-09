# Minecraft Vulnerability Management
Educational 4 player minecraft scenario focusing on vulnerability management - identification, prioritization, triage. At the end of each round players can be scored on performance.

## Requirements
- Linux (Tested on Ubuntu 14.04 server) - sh scripts assume standard linux utilities
- GNU screen
- Oracle Java 8
- Minecraft server jar (Tested on 1.10) - https://s3.amazonaws.com/Minecraft.Download/versions/1.10/minecraft_server.1.10.jar

## Setup
- Clone repo
- Configure whitelist.json and ops.json
- Add minecraft server .jar to folder and run: `./start-minecraft.sh`
- or start in a screen manually:  
`screen -S minecraft -d -m`  
`screen -S minecraft -X stuff 'java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui'$(echo -ne '\015')`

## Operation
- run shell scripts
- 10 minute timer default
- scoring

## Additional resources
- [Minecraft Network Defense scenario handout (PDF)](https://github.com/wjwoodson/minecraft-vuln-mgt/blob/master/resources/minecraft-network-defense-handout.pdf)
