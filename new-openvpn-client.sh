#!/bin/bash

expect -f script.exp $1

# Either read the CN from $1 or prompt for it
#if [ -z "$1" ]
#    then echo -n "Enter new client common name (CN): "
#    read -e CN
#else
#    CN=$1
#fi

docker run -v ovpn-data:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient $1 > $1.ovpn
