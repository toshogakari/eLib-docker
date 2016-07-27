FROM busybox:latest
MAINTAINER Tsukasa Arima

COPY confs /tmp/confs
ARG CONF_DIR=/tmp/confs

RUN set -x \
        && cd $CONF_DIR \
        && mkdir -p -m 755 /var/lib/postgresql/data \
        && mkdir -p -m 755 /etc/redis \
        && cp -rf redis/redis.conf /etc/redis/redis.conf \
        # && chown -R redis:redis /etc/redis \
        && mkdir -p -m 755 /etc/nginx \
        && cp -rf nginx/conf.d /etc/nginx/conf.d

VOLUME ["/var/lib/postgresql/data", "/etc/redis", "/etc/nginx/conf.d"]

CMD ["sh"]
