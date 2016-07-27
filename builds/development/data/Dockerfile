FROM busybox:latest
MAINTAINER Tsukasa Arima

COPY confs /tmp/confs
ARG CONF_DIR=/tmp/confs
ARG PSQL_VERSION=9.5

RUN set -x \
        && cd $CONF_DIR \
        && mkdir -p -m 755 /var/lib/postgresql \
        && mkdir -p -m 755 /usr/share/postgresql/$PSQL_VERSION \
        && cp -rf postgresql/postgresql.conf /usr/share/postgresql/$PSQL_VERSION/postgresql.conf \
        && mkdir -p -m 755 /etc/redis \
        && cp -rf redis/redis.conf /etc/redis/redis.conf \
        # && chown -R redis:redis /etc/redis \
        && mkdir -p -m 755 /etc/nginx \
        && cp -rf nginx/conf.d /etc/nginx/conf.d

VOLUME ["/var/lib/postgresql", "/usr/share/postgresql/$PSQL_VERSION", "/etc/redis", "/etc/nginx/conf.d"]

CMD ["sh"]
