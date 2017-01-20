FROM pyar6329/rails-base:dev-2.3.3
MAINTAINER Tsukasa Arima

ARG USER_NAME="rails"
ARG GROUP_NAME="rails"
ARG GCP_ID="1001"

COPY app/Gemfile* /usr/src/app/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN set -x \
    && addgroup -g ${GCP_ID} ${USER_NAME} \
    && adduser -D -s /bin/bash -G ${GROUP_NAME} -h /home/${USER_NAME} -u ${GCP_ID} ${USER_NAME} \
    && cp -rf /root/.bashrc /home/${USER_NAME} \
    && echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers \
    && CPU_CORES="$(cat /proc/cpuinfo | grep "cpu cores" | wc -l)" \
    && chmod u+x /usr/local/bin/docker-entrypoint.sh \
    && cd /usr/src/app \
    && gem update --system \
    && gem update bundler \
    && bundle install --jobs=${CPU_CORES}

COPY app /usr/src/app

RUN set -x \
    && chown -R rails:rails /usr/src/app ${GEM_HOME}

USER ${USER_NAME}
WORKDIR /usr/src/app

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["spring", "rails", "s", "-p", "3000", "-b", "0.0.0.0", "-P", "/tmp/rails_server.pid"]

EXPOSE 3000
