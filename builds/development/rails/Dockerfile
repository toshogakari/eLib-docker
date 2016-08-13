FROM pyar6329/rails-base:dev-2.3.1-6.3.1
MAINTAINER Tsukasa Arima

# RUN set -x \
#     && rm -rf /usr/local/bin/docker-entrypoint.sh
#
COPY docker-entrypoint.sh /usr/local/bin/

RUN set -x \
    && chmod u+x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3000
