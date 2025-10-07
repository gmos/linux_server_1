#!/bin/bash

set -e

echo "Starting initial setup for Certbot..."
# Check if the necessary directories exist, if not create them
docker run -it --rm --name certbot \
    -v /home/wams/wams_data/certbot/conf:/etc/letsencrypt \
    -v /home/wams/wams_data/certbot/www:/var/www/certbot \
    certbot/certbot certonly --non-interactive --agree-tos \
    --email "$CERTBOT_EMAIL" \
    --domains "$CERTBOT_DOMAINS" \
    $( [ "$CERTBOT_STAGING" = "1" ] && echo "--staging" )