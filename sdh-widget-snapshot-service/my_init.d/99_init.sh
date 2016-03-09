#!/bin/sh


SDHNAME="sdh-widget-snapshot-service"

Configure() {
    sed -i \
        -e "s|config.port\s*=\s*.*|config.port=8888|g" \
        -e "s|config.persistence.directory\s*=\s*.*|config.persistence.directory=\"/home/persisted/\"|g" \
        -e "s|config.persistence.redis.host\s*=\s*.*|config.persistence.redis.host=\"$REDIS_HOST\"|g" \
        -e "s|config.persistence.redis.port\s*=\s*.*|config.persistence.redis.port=$REDIS_PORT|g" \
        -e "s|config.phantom.workers\s*=\s*.*|config.phantom.workers=$PHANTOM_WORKERS|g" \
        -e "s|config.phantom.executors_per_worker\s*=\s*.*|config.phantom.executors_per_worker=$PHANTOM_EXECUTORS_PER_WORKER|g" \
        -e "s|config.api.url\s*=\s*.*|config.api.url=\"$API_URL\"|g" \
    config.js

}

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
    cp config.sample.js config.js
    echo "> Configuring Service"
    Configure
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

