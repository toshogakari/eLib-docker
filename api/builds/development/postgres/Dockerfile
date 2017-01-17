FROM postgres:9.6-alpine

COPY initdb.d /tmp/initdb.d
ARG GLIB_C_VERSION=2.23-r3

RUN set -x && \
    apk add --no-cache --virtual .build-packages curl ca-certificates && \
    curl -sL "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIB_C_VERSION}/sgerrand.rsa.pub" -o /etc/apk/keys/sgerrand.rsa.pub && \
    curl -sL "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIB_C_VERSION}/glibc-${GLIB_C_VERSION}.apk" -o /tmp/glibc.apk && \
    curl -sL "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIB_C_VERSION}/glibc-bin-${GLIB_C_VERSION}.apk" -o /tmp/glibc-bin.apk && \
    curl -sL "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIB_C_VERSION}/glibc-i18n-${GLIB_C_VERSION}.apk" -o /tmp/glibc-i18n.apk && \
    apk add --no-cache /tmp/glibc*.apk && \
    cp -rf /tmp/initdb.d/* /docker-entrypoint-initdb.d && \
    /usr/glibc-compat/bin/localedef -i ja_JP -c -f UTF-8 -A /usr/glibc-compat/share/locale/locale.alias ja_JP.UTF-8 && \
    apk del .build-packages && \
    rm -rf /tmp/initdb.d /tmp/glibc* /var/cache/apk/*

ENV LANG=C PATH=/usr/glibc-compat/bin:${PATH}

