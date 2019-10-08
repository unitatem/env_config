#!/bin/bash

if [ ! -d "code" ]; then
    git clone ssh://git@git.falcons-robocup.nl:2222/falcons/code.git
    cd code
    git checkout integration
    git pull
    cd ..
fi

if [ ! -d "data" ]; then
    git clone ssh://git@git.falcons-robocup.nl:2222/falcons/data.git
    cd data
    git checkout master
    git pull
    cd ..
fi

if [ ! -d "teamplayData" ]; then
    git clone ssh://git@git.falcons-robocup.nl:2222/falcons/teamplayData.git
    cd teamplayData
    git checkout integration
    git pull
    cd ..
fi
