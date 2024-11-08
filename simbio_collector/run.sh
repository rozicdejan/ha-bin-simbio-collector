#!/usr/bin/with-contenv bashio
set -e

# Make sure options.json exists
if [ ! -f /data/options.json ]; then
    echo "No options.json found! Please configure the addon first."
    exit 1
fi

# Load configuration from options.json
ADDRESS=$(jq --raw-output '.address // empty' /data/options.json)

# Verify address is set
if [ -z "$ADDRESS" ]; then
    echo "Address not set in options.json"
    exit 1
fi

# Run the Go application with the address argument
exec /app/bin-waste-collection --address "$ADDRESS"