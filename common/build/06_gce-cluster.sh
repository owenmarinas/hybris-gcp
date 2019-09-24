#!/bin/bash

#set -e
set -x

# Import the settings from the common settings file
source ../project_settings.sh

# Create a 3 node GCE cluster
gcloud beta container clusters create $GCE_CLUSTER  \
  --project $PROJECT_NAME  --zone $PROJECT_ZONE  --no-enable-basic-auth \
  --cluster-version "1.12.8-gke.10" --machine-type "n1-standard-4" --image-type "COS" --disk-type "pd-standard" --disk-size "100" \
  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
  --num-nodes "4" --enable-stackdriver-kubernetes --enable-ip-alias --issue-client-certificate \
  --network $SERVICES_NETWORK  --subnetwork $SERVICES_SUBNET --default-max-pods-per-node "110"  \
  --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair --metadata disable-legacy-endpoints=true
