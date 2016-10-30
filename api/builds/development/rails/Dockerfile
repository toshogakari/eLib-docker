FROM pyar6329/rails-base:dev-ruby-2.3.1
MAINTAINER Tsukasa Arima

# RUN set -x \
#     && rm -rf /usr/local/bin/docker-entrypoint.sh
#
COPY docker-entrypoint.sh /usr/local/bin/

RUN set -x \
    && chmod u+x /usr/local/bin/docker-entrypoint.sh

WORKDIR /usr/src/app

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["spring", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]

EXPOSE 3000
