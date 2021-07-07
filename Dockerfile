FROM mpadge/pkgcheck
MAINTAINER Mark Padgham <mark.padgham@email.com>

RUN install2.r \
  plumber \
  visNetwork \
&& installGithub.r \
      ropensci-review-tools/pkgstats \
      ropensci-review-tools/pkgcheck \
      ropensci-review-tools/roreviewapi

RUN echo "GITHUB_TOKEN='<my_github_token>'" > ~/.Renviron \
    && echo "GITHUB_PAT='<my_github_token>'" >> ~/.Renviron \
    && git config --global user.name "username" \
    && git config --global user.email "my.address@mail.com"

EXPOSE 8000

RUN echo "#!/bin/bash\nRscript -e 'roreviewapi::serve_api(port=8000L)'" > /server_api.sh \
  && chmod a+x /server_api.sh

CMD /server_api.sh
