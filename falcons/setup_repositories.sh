#!/bin/bash

if [ ! -d "code" ]; then
    git clone ssh://git@git.falcons-robocup.nl:2222/falcons/code.git
fi

if [ ! -d "data" ]; then
    git clone ssh://git@git.falcons-robocup.nl:2222/falcons/data.git
fi

if [ ! -d "teamplayData" ]; then
    git clone ssh://git@git.falcons-robocup.nl:2222/falcons/teamplayData.git
fi
