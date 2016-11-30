#!/bin/bash

docker ps -a | sed '1 d' | awk '{print $1}' | xargs -L1 docker stop
docker ps -a | sed '1 d' | awk '{print $1}' | xargs -L1 docker rm

# MYSQL 
export MYSQL_ROOT_PASSWORD=[password]
export MYSQL_DATABASE=[db]
export MYSQL_USER=[user]
export MYSQL_PASSWORD=[user_password]


# DB
docker run --name db \
        --net [network] --ip [ip] \
        -v [data]:/var/lib/mysql \
        -v [conf.d]:/etc/mysql/conf.d \
        -d --restart=always ejzspb/arm-mariadb
		
# NODEJS
docker run --name node -d --restart=always --net [network] --ip [ip] \
	-v [data]:/opt/app \
	--link db:mysql \
	-p 8087 \
	inode
	
# PHP 	
docker run -d --restart=always --net [network] --ip [ip] -e ALLOW_OVERRIDE=true  --name web \
	--link db:mysql  \
	-v [www]:/opt/app/www:rw iphp
	
# PROXY
docker run -d --restart=always --name proxy --link node --link web --link db:mysql --net [network] --ip [ip] -p 80:80 ihaproxy

