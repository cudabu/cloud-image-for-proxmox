#!/bin/bash

# =======================================================================================================
# TEMPLATE ONLY - Copy this file to ./rebuild-debian-templates.sh and configure that file for your needs.
# =======================================================================================================

ACCOUNT_NAME=cudabu
PASSWORD=cudabu
DOMAIN=lab.cudabu.io
LAUNCHPAD_USER=cudabu

HOSTNAME=$(echo `hostname` | cut -d'.' -f1)
HOST_DIGIT=${HOSTNAME: -1}

echo "[*] Rebuilding 'Bookworm 12'..."
./prox-cloud-template-add-debian.sh ${HOST_DIGIT}11200 SSD-0${HOST_DIGIT}A Bookworm 12 $ACCOUNT_NAME $PASSWORD $DOMAIN $LAUNCHPAD_USER

echo "[*] Rebuilding 'Bullseye 11'..."
./prox-cloud-template-add-debian.sh ${HOST_DIGIT}11100 SSD-0${HOST_DIGIT}A Bullseye 11 $ACCOUNT_NAME $PASSWORD $DOMAIN $LAUNCHPAD_USER

echo "[*] Rebuilding 'Buster 10'..."
./prox-cloud-template-add-debian.sh ${HOST_DIGIT}11000 SSD-0${HOST_DIGIT}A Buster 10 $ACCOUNT_NAME $PASSWORD $DOMAIN $LAUNCHPAD_USER

# In this template, this assumes that your ProxMox server names end in a single digit
# and that this script is running on one of those ProxMox nodes. Example: pmvm3
#
# Next, on this ProxMox node, it's assumed there is storage configured with the name 
# "SSD-03A", "SSD-03B", etc where the 3 refers to the node number, so that you can 
# differentiate this storage when looking at a cluster view.
#
# Similarly, VM id's can be anything, but to make it consistent, this assumes that 
# VM's or templates on the pmvm3 machine, start with the number 3. And in this case
# these templates will be created with high numbers (e.g. 308000, 309000, etc) to 
# keep them at the end of the list of VM's. The "8000" and "9000" is metadata for the 
# version of that distribution (e.g. "8000" is CentOS 8 Stream with no minor version 
# since it's a "stream", or rolling version, for example)
