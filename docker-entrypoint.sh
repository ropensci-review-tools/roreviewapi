#!/bin/bash
# Write ~/.Renviron from runtime environment variables (supplied by compose
# 'env_file'), so that no secrets are baked into image layers.
set -e

: > ~/.Renviron
echo "GITHUB_PAT='${GITHUB_PAT}'" >> ~/.Renviron
echo "PKGCHECK_TOKEN='${PKGCHECK_TOKEN}'" >> ~/.Renviron
echo "GMAIL_SENDER='${GMAIL_SENDER}'" >> ~/.Renviron
echo "GMAIL_OAUTH_CLIENT_SECRET='${GMAIL_OAUTH_CLIENT_SECRET}'" >> ~/.Renviron
echo "GMAIL_TOKEN_CACHE='${GMAIL_TOKEN_CACHE}'" >> ~/.Renviron
echo "GMAIL_AUTH_EMAIL='${GMAIL_AUTH_EMAIL}'" >> ~/.Renviron
echo "AIRTABLE_API_KEY='${AIRTABLE_API_KEY}'" >> ~/.Renviron
echo "AIRTABLE_BASE_ID='${AIRTABLE_BASE_ID}'" >> ~/.Renviron
echo "ROREVIEWAPI_BASE_URL='${ROREVIEWAPI_BASE_URL}'" >> ~/.Renviron
echo "GITHUB_TOKEN='${GITHUB_PAT}'" >> ~/.Renviron
echo "ROREV_CONTAINER='true'" >> ~/.Renviron

exec Rscript -e 'roreviewapi::serve_api(port=8000L,os="ubuntu",os_release="24.04")'
