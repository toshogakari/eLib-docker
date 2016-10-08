FROM mhart/alpine-node:6.7.0
MAINTAINER Tsukasa Arima

# RUN set -x \
#     && rm -rf /usr/local/bin/docker-entrypoint.sh
#
COPY docker-entrypoint.sh /usr/local/bin/
COPY app /app

RUN set -x \
    && chmod u+x /usr/local/bin/docker-entrypoint.sh
    && cd /app
    && npm i -g

CMD ["npm", "s"]
EXPOSE 3000
