#!/bin/sh


SDHNAME="sdh-widget-snapshot-service"

Update() {
    ROOT=$(pwd)
    cd /home/
    VC_DIR=$1/.git
    if [ ! -d $VC_DIR ]
    then
        echo "Repository is not present, need to clone."
        git clone $2 $1
        cd $1
    else
        echo "Pulling..."
        cd $1
        git pull
    fi

    #Create directory to store parsisted images
    mkdir -p /home/persisted/

    npm install --unsafe-perm

    echo "> Starting Service"
    Start

    cd $ROOT
}

Start() {
    # Start the service
    npm start &
}

echo "> SDH Widget Snapshot Service"
Update $SDHNAME https://github.com/smartdeveloperhub/$SDHNAME.git

