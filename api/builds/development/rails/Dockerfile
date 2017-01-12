FROM pyar6329/rails-base:dev-2.3.3
MAINTAINER Tsukasa Arima

COPY app/Gemfile* /usr/src/app/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN set -x \
    && CPU_CORES="$(cat /proc/cpuinfo | grep "cpu cores" | wc -l)" \
    && chmod u+x /usr/local/bin/docker-entrypoint.sh \
    && cd /usr/src/app \
    && gem update --system \
    && gem update bundler \
    && bundle install --jobs=${CPU_CORES}

COPY app /usr/src/app

WORKDIR /usr/src/app

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["spring", "rails", "s", "-p", "3000", "-b", "0.0.0.0", "-P", "/tmp/rails_server.pid"]

EXPOSE 3000
