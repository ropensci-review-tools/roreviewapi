FROM ghcr.io/ropensci-review-tools/pkgcheck
LABEL org.opencontainers.image.authors="mark.padgham@email.com"

ENV R_REMOTES_UPGRADE "always"
ENV NOT_CRAN "true"
ENV CI "true"
ENV ROPENSCI "true"
ENV GITHUB_PAT "<my_github_token>"
ENV ROPENSCI_REVIEW_BOT "true"

# seasonal -> roreviewapi#13
RUN install2.r \
  BiocManager \
  plumber \
  visNetwork \
&& installGithub.r \
      ropensci-review-tools/roreviewapi

RUN echo "GITHUB_TOKEN='<my_github_token>'" > ~/.Renviron \
    && echo "GITHUB_PAT='<my_github_token>'" >> ~/.Renviron \
    && echo "PKGCHECK_TOKEN='<pkgcheck_token>'" >> ~/.Renviron \
    && echo "ROREV_CONTAINER='true'" >> ~/.Renviron \
    && git config --global user.name "username" \
    && git config --global user.email "my.address@mail.com"

EXPOSE 8000

RUN echo "#!/bin/bash\nRscript -e 'roreviewapi::serve_api(port=8000L,os=\"ubuntu\",os_release=\"24.04\")'" > /server_api.sh \
  && chmod a+x /server_api.sh

CMD /server_api.sh
