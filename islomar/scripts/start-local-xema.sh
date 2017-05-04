#!/bin/bash

source `which virtualenvwrapper.sh`
cd ~/workspace/felix
workon felix
source dev/bin/env_develop
dev/bin/start_local_xema.sh
