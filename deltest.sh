#!/bin/bash

docker exec $(docker ps -q) rm /etc/openvpn/pki/reqs/test.req
docker exec $(docker ps -q) rm /etc/openvpn/pki/private/test.key
docker exec $(docker ps -q) rm /etc/openvpn/pki/issued/test.crt

