#!/bin/bash
# Write ~/.Renviron from runtime environment variables (supplied by compose
# 'env_file'), so that no secrets are baked into image layers.
set -eu

required_vars=(
    GITHUB_PAT
    PKGCHECK_TOKEN
    GMAIL_SENDER
    GMAIL_OAUTH_CLIENT_SECRET
    GMAIL_TOKEN_CACHE
    GMAIL_AUTH_EMAIL
    AIRTABLE_API_KEY
    AIRTABLE_BASE_ID
    ROREVIEWAPI_BASE_URL
)
missing=()
for v in "${required_vars[@]}"; do
    if [ -z "${!v:-}" ]; then
        missing+=("$v")
    fi
done
if [ ${#missing[@]} -gt 0 ]; then
    echo "ERROR: missing required environment variables: ${missing[*]}" >&2
    echo "Check that they are set in the '.env' file next to docker-compose.yml." >&2
    exit 1
fi

# Gmail credentials must be in the bind-mounted '/data/email' directory
# (see vignettes/editorsearch.Rmd).
if [ ! -f "$GMAIL_OAUTH_CLIENT_SECRET" ]; then
    echo "ERROR: GMAIL_OAUTH_CLIENT_SECRET file not found: $GMAIL_OAUTH_CLIENT_SECRET" >&2
    exit 1
fi
if [ ! -d "$GMAIL_TOKEN_CACHE" ] || [ -z "$(ls -A "$GMAIL_TOKEN_CACHE")" ]; then
    echo "ERROR: GMAIL_TOKEN_CACHE directory missing or empty: $GMAIL_TOKEN_CACHE" >&2
    exit 1
fi

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
