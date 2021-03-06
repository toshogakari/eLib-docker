# eLib docker (front)

## 準備
dockerをインストールしておく

[https://www.docker.com/products/docker](https://www.docker.com/products/docker)

使うのはdockerとdocker-compose

## Using

### 起動

```
$ git clone git@github.com:toshogakari/eLib-docker.git
$ cd eLib-docker/front
$ git clone git@github.com:toshogakari/eLib-front.git builds/development/node/app
$ docker-compose up -d
```

`docker-compose up` だとforegroundで起動

[http://localhost:3000](http://localhost:3000) にアクセス

### Coding

`builds/development/node/app` がマウントされるので、そのディレクトリを編集する。

### bashでログイン

```
$ docker exec -it $(docker ps -a | grep elib_ | awk '{print $1}') bash
```

railsアプリは `/usr/src/app` 内にあります。

### log表示

```
$ docker logs $(docker ps -a | grep elib_ | awk '{print $1}')
```

### 終了

```
$ docker-compose down
```

#### それでも終了しない場合

```

$ docker ps -a -q | xargs -r -n 1 -I {} docker rm -f {}
$ docker volume ls -qf dangling=true | xargs -r -n 1 -I {} docker volume rm {}
```

### dockerのimage削除

#### elibのみ削除

```
$ docker images | grep elib | awk '{print $3}' | xargs -r -n 1 -I {} docker rmi -f {}
```

#### 全て削除
```
$ docker images -q | xargs -r -n 1 -I {} docker rmi -f {}
```
