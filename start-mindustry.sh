#!/bin/sh

SERVER_NAME:=WFH Covid-19
PLAYER_LIMIT:=8

java -jar /opt/mindustry/server-release.jar \
    "host,playerLimit $PLAYER_LIMIT,name $SERVER_NAME"