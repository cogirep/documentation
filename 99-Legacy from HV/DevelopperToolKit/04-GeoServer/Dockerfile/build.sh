#!/bin/sh
# Check the GeoServer version specified in the Dockerfile and substitute the number in the globals starting with OLD.

# This represents the version we need GeoServer to move up to. ie the latest stable version
BUGFIX=0
MINOR=14
MAJOR=2

# Build Geoserver
echo "Building GeoServer using the specified version "
docker build --build-arg GS_VERSION=${MAJOR}.${MINOR}.${BUGFIX} -t sixense/geoserver:${MAJOR}.${MINOR}.${BUGFIX} .