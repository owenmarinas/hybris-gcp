#!/bin/bash

# To see all the posible services...
# gcloud services list  --available --sort-by="NAME"

# To see all the enabled services...
# gcloud services list  --enabled --sort-by="NAME"

# Shared services
# Enable Storage.
set -e
set -x
gcloud services enable storage-component.googleapis.com
# Enable Stackdriver
gcloud services enable stackdriver.googleapis.com
# Enable Cloud SQL
gcloud services enable sql-component.googleapis.com
# Enable Datastore
gcloud services enable datastore.googleapis.com


# The frontend application
# Enable Cloud Functions
gcloud services enable cloudfunctions.googleapis.com

# Enable Compute Engine
gcloud services enable compute.googleapis.com
