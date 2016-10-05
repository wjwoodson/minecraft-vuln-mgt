#!/bin/bash
# Ubuntu 14.04
# setup.sh

sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer screen

cd minecraft-vuln-mgt
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.10/minecraft_server.1.10.jar

echo "!!! Minecraft Network Defense !!!"
echo "Run the command below for either 4 or 2 player scenario: "
echo "./minecraft-vuln-mgt.sh"
echo "./minecraft-vuln-mgt-2p.sh"
