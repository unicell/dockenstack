#!/bin/bash
if [ -z "$REQUIREMENTS_BRANCH" ]; then
    $REQUIREMENTS_BRANCH="master"
fi

pip install -r https://raw.githubusercontent.com/openstack/requirements/$REQUIREMENTS_BRANCH/global-requirements.txt
pip install -r https://raw.githubusercontent.com/openstack/requirements/$REQUIREMENTS_BRANCH/test-requirements.txt
