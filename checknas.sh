#!/bin/bash

# Set the NAS IP address or hostname
nas_host=192.168.0.200

# Set the username and password for the admin account on the NAS
nas_user=admin
nas_pass=mypassword

# Get the system status from the NAS
status=$(synocli --host $nas_host --user $nas_user --pass $nas_pass --protocol https system-status)

# Check if the system is healthy
if [[ $status == *"Healthy"* ]]; then
    echo "NAS system is healthy."
else
    echo "NAS system is not healthy."
fi

# Get the storage pool status from the NAS
pool_status=$(synocli --host $nas_host --user $nas_user --pass $nas_pass --protocol https storage-pool-status)

# Check if all storage pools are healthy
if [[ $pool_status == *"Healthy"* ]]; then
    echo "All storage pools are healthy."
else
    echo "One or more storage pools are not healthy."
fi
