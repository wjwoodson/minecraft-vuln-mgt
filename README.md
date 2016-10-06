# Minecraft Network Defense
Educational 2-4 player minecraft scenario focusing on vulnerability management - identification, prioritization, triage. At the end of each round players can be scored on performance.

Defend your network against cyber threats in a multiplayer Minecraft scenario. Build a firewall to keep attackers out of a defensive perimeter. Use cyber defense tools to stop the bad guys, and go hunting for cyber threat intelligence. But watch out, sophisticated attackers might already be inside your network!

## Requirements
- Linux (Tested on Ubuntu 14.04 server) - sh scripts assume standard linux utilities
- GNU screen
- Oracle Java 8
- Minecraft server jar (Tested on [Minecraft server 1.10](https://s3.amazonaws.com/Minecraft.Download/versions/1.10/minecraft_server.1.10.jar))
- Valid minecraft licenses (2-4)

## Setup
- Clone repo: `git clone https://github.com/wjwoodson/minecraft-vuln-mgt.git`
- If Requirements not installed, run `./setup.sh` (Ubuntu 14.04)
- Configure whitelist.json and ops.json with player names/UUIDs   
Example whitelist.json:   
`[   
       {   
               "uuid": 00000000-0000-0000-0000-000000000",   
               "name": "player1"   
       }   
]`   

## Operation
- run the scenario:   
`./minecraft-vuln-mgt.sh` (4 player)   
`./minecraft-vuln-mgt-2p.sh` (2 player)
- Connect players to Multiplayer -> Direct Connect -> `<your_host>:9800`


## Additional resources
- [Minecraft Network Defense scenario handout (PDF)](https://github.com/wjwoodson/minecraft-vuln-mgt/blob/master/resources/minecraft-network-defense-handout.pdf)
- Minecraft gamepad keymaps (for [Logitech F310 Gamepad](http://gaming.logitech.com/en-us/product/f310-gamepad)):  
[Keymap Diagram (PDF)](https://github.com/wjwoodson/minecraft-vuln-mgt/blob/master/resources/logitech-f310-mapping-minecraft-vuln-mgt.pdf)  
[Windows keymap](https://github.com/wjwoodson/minecraft-vuln-mgt/blob/master/resources/logitech-f310-mapping-minecraft-vuln-mgt.xml) - [Logitech Gaming Software](http://support.logitech.com/en_us/product/gamepad-f310#download)  
[Max OS X keymap](https://github.com/wjwoodson/minecraft-vuln-mgt/blob/master/resources/logitech-f310-mapping-minecraft-vuln-mgt.enjoyable) - [Enjoyable](https://yukkurigames.com/enjoyable/)
