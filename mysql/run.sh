#!/bin/bash

export MYSQL_ROOT_PASSWORD=[password]
export MYSQL_DATABASE=[db]
export MYSQL_USER=[user]
export MYSQL_PASSWORD=[user_password]

docker run --name db \
	--net [network] --ip [ip] \
	-v [data]:/var/lib/mysql \
	-v [conf.d]:/etc/mysql/conf.d \
	-d  ejzspb/arm-mariadb

