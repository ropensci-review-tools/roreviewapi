FROM mpadge/pkgcheck
MAINTAINER Mark Padgham <mark.padgham@email.com>

# A selection of R packages, including extra stats packages
RUN install2.r \
  devtools \
  foreign \
  glmnet \
  lme4 \
  mgcv \
  Rcpp \
  RcppArmadillo \
  RcppEigen \
  RcppParallel \
  randomForest \
  rmarkdown \
  survival \
  tidymodels \
  tidyverse \
  xts \
  zoo

# Explicit packages for this server:
RUN install2.r \
  plumber \
  visNetwork \
&& installGithub.r \
      ropensci-review-tools/pkgstats \
      ropensci-review-tools/pkgcheck \
      ropensci-review-tools/roreviewapi

#RUN echo "GITHUB_TOKEN='<my_github_token>'" > ~/.Renviron \
#    && echo "GITHUB_PAT='<my_github_token>'" > ~/.Renviron \
#RUN git config --global user.name "username" \
#    && git config --global user.email "my.address@mail.com"
RUN echo "GITHUB_TOKEN='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'" > ~/.Renviron \
    && echo "GITHUB_PAT='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'" >> ~/.Renviron
RUN git config --global user.name "mpadge" \
    && git config --global user.email "mark.padgham@email.com"

EXPOSE 8000

RUN echo "#!/bin/bash\nRscript -e 'roreviewapi::serve_api(port=8000L)'" > /server_api.sh \
  && chmod a+x /server_api.sh

CMD /server_api.sh
