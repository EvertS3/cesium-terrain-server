#!/bin/sh

##
# Install the terrain server
#

# If a local source code archive does not exist, get it from GitHub.
checkout='master'
archive="/tmp/local/cesium-terrain-server-${checkout}.tar.gz"
if [ ! -f $archive ]; then
    wget --no-verbose -O $archive "https://github.com/geo-data/cesium-terrain-server/archive/${checkout}.tar.gz" || exit 1
fi

# Set up the source directory
CTS_DIR=/usr/local/go/src/github.com/geo-data/cesium-terrain-server
sudo mkdir -p $CTS_DIR || exit 1
cd $CTS_DIR || exit 1

# Extract the terrain server code
sudo tar --strip-components=1 -xzf $archive || exit 1

# Build and install the server
sudo make install || exit 1
