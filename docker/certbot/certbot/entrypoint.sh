#!/bin/bash

set -e

# Renew the certificates
while true; do
    certbot renew
    sleep 86400 # Sleep for 24 hours (24 * 60 * 60 seconds)
done
