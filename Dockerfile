# syntax=docker/dockerfile:1
FROM ghcr.io/ropensci-review-tools/pkgcheck
LABEL org.opencontainers.image.authors="mark.padgham@email.com"

ENV R_REMOTES_UPGRADE="always"
ENV NOT_CRAN="true"
ENV CI="true"
ENV ROPENSCI="true"
ENV ROPENSCI_REVIEW_BOT="true"

# seasonal -> roreviewapi#13
# GITHUB_PAT is passed as a BuildKit secret (see docker-compose.yml), so it is
# available to this step without being stored in any image layer.
RUN --mount=type=secret,id=github_pat,required=true \
  export GITHUB_PAT="$(cat /run/secrets/github_pat)" \
  && install2.r \
  BiocManager \
  plumber \
  toml \
  visNetwork \
&& installGithub.r \
      ropensci-review-tools/pkgmatch \
      ropensci-review-tools/roreviewapi

RUN git config --global user.name "username" \
    && git config --global user.email "my.address@mail.com" \
    && git config --global credential.helper cache

# Secrets are supplied at runtime via 'env_file' in docker-compose.yml
# and written to ~/.Renviron by the entrypoint.
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8000

CMD ["/docker-entrypoint.sh"]
