#!/bin/bash

#set -e
set -x

# Import the settings from the common settings file
source ../project_settings.sh


gcloud compute networks create $SERVICES_NETWORK \
    --project=$PROJECT_NAME \
    --description="A custom network for hybris components" \
    --subnet-mode=custom

gcloud beta compute networks subnets create $SERVICES_SUBNET \
    --project=$PROJECT_NAME \
    --network=$SERVICES_NETWORK \
    --region=$PROJECT_REGION \
    --range=10.29.0.0/24 \
    --enable-private-ip-google-access \
    --enable-flow-logs

# Create firewall rules to allow the instances to be reachable to each other.
gcloud compute firewall-rules create "$SERVICES_NETWORK-internal-access" \
    --network $SERVICES_NETWORK \
    --allow tcp,udp,icmp \
    --source-ranges 10.29.0.0/24


gcloud compute firewall-rules create "$SERVICES_NETWORK-ssh" \
    --network $SERVICES_NETWORK \
    --allow tcp:22
