#!/bin/sh
# needed so a database file is created to be able to create a admin user automatically
./pocketbase serve --http 0.0.0.0:8090 --automigrate=0 &
sleep 4
kill $(pidof pocketbase)
# creates admin from env vars or errors if nothing is provided
./pocketbase admin create $POCKETBASE_ADMIN $POCKETBASE_PASSWORD
# starts PocketBase
./pocketbase serve --http 0.0.0.0:8090 --automigrate=0