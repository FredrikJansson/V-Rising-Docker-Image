#!/bin/sh
# Static paths
SERVER_DIR=/home/steam/Steam/steamapps/common/VRisingDedicatedServer

./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +app_update 1829350 validate +quit

cd $SERVER_DIR
Xvfb :0 -screen 0 1024x768x16 & DISPLAY=:0.0 wine VRisingServer.exe -persistentDataPath Z:\\saves