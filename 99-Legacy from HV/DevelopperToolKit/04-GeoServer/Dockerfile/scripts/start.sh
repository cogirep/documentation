#!/usr/bin/env bash
if [ -f /tmp/backup/backup.zip ]; then
    unzip -o /tmp/backup/backup.zip -d $GEOSERVER_DATA_DIR 
    rm -rf /tmp/backup 
    dpkg --remove --force-depends  unzip 
fi
catalina.sh run