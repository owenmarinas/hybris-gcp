#!/bin/bash

# The name of the project to deploy services into.
PROJECT_NAME="gke-hybris-1"

# Which default region should regional services use?
PROJECT_REGION="us-east1"

# Which default zone should zonal service use?
PROJECT_ZONE="us-east1-d"

# Used as a suffix for select service names.
ENV_TYPE="dev"

# Used as a prefix for select service names.
ORGANIZATION="ras-hybris"

# This is the Storage bucket used for public assets.
# The entire bucket is public by default
PUBLIC_ASSETS="ras-hybris-public-bucket"

# This is the Storage bucket used for private assets.
# The entire bucket is private by default
PRIVATE_ASSETS="ras-hybris-private-bucket"

# The name of the custom network for the product and ads services
SERVICES_NETWORK="ras-hybris-network"

# The name of the product service subnet
SERVICES_SUBNET="ras-hybris-network-subnet"

# The name of the spanner instance
#PRODUCT_DB_INSTANCE_NAME="fs2-app-spanner-instance"

# The name of the spanner db
#PRODUCT_DB_NAME="fs2-app-spanner-db"

# The service account to use to launch the compute engine instances.
COMPUTE_ENGINE_SERVICE_ACCOUNT=$(gcloud iam service-accounts list --filter='displayName:"Compute Engine default service account"' --format='value(email)')

# The cloud function name
#FUNCTION_NAME="fs2-upload"

