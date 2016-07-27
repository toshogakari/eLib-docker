#!/bin/bash

set -e

# http://qiita.com/imura81gt/items/7e7812e5bfe8842f645e


## 3台のOSを起動
docker-machine create -d virtualbox manager
docker-machine create -d virtualbox worker1
docker-machine create -d virtualbox worker2

# docker-machine ls
# docker node ls

# 1つ目をmanagerにする
eval $(docker-machine env manager)
docker swarm init

# 2つ目をworkerとして追加する
eval $(docker-machine env worker1)
docker swarm join $(docker-machine ip manager):2377

# 3つ目をworkerとして追加する
eval $(docker-machine env worker2)
docker swarm join $(docker-machine ip manager):2377

# serviceとしてnginxを追加
# manager nodeでしか起動できない
eval $(docker-machine env manager)
# docker service create --replicas 1 -p 80:80/tcp --name nginx nginx
docker service ls
# docker service tasks nginx
# docker service scale nginx=5
# docker service tasks nginx

# docker service create --replicas 1 -p 6379:6379/tcp –network mynet --name redis redis:latest
# docker service create --replicas 1 -p 6379:6379/tcp --name redis redis:latest
# redisのconfファイルで bind 0.0.0.0にしないと外部から受け付けない
# https://github.com/geerlingguy/ansible-role-redis/blob/master/templates/redis.conf.j2
# https://github.com/docker-library/redis/blob/master/3.2/Dockerfile
# https://hub.docker.com/_/redis/
# https://github.com/docker/docker/blob/master/experimental/docker-stacks-and-bundles.md

# ファイル名は dab? https://github.com/docker/docker/issues/23791

# docker-compose pull
# docker-compose build
# docker-compose push
# docker-compose bundle -o foo.dab
# docker deploy foo
