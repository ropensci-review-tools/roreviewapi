FROM ghcr.io/ropensci-review-tools/pkgcheck
LABEL org.opencontainers.image.authors="mark.padgham@email.com"

ENV R_REMOTES_UPGRADE "always"
ENV NOT_CRAN "true"
ENV CI "true"
ENV ROPENSCI "true"
ENV GITHUB_PAT "<my_github_token>"

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

# Qaurto binary:
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.40/quarto-1.6.40-linux-amd64.tar.gz \
    && mkdir ~/opt \
    && tar -C ~/opt -xvzf quarto-1.6.40-linux-amd64.tar.gz \
    && ln -s ~/opt/quarto-1.6.40/bin/quarto /usr/local/bin/quarto \
    && rm quarto-1.6.40-linux-amd64.tar.gz \

EXPOSE 8000

RUN echo "#!/bin/bash\nRscript -e 'roreviewapi::serve_api(port=8000L,os=\"ubuntu\",os_release=\"20.04\")'" > /server_api.sh \
  && chmod a+x /server_api.sh

CMD /server_api.sh
