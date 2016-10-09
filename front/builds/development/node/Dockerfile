FROM mhart/alpine-node:6.7.0
MAINTAINER Tsukasa Arima

COPY docker-entrypoint.sh /usr/local/bin/
COPY app /app

RUN set -x \
    && chmod u+x /usr/local/bin/docker-entrypoint.sh \
    && cd /app \
    && npm i -g

WORKDIR /app

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["npm", "start"]

EXPOSE 8080
