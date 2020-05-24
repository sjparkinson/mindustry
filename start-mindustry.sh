#!/bin/sh

SERVER_NAME="WFH Covid-19"
PLAYER_LIMIT=8

java -jar /opt/mindustry/server-release.jar \
    "config name $SERVER_NAME,playerlimit $PLAYER_LIMIT,host"