#!/bin/bash 

export MYSQL_ROOT_PASSWORD=[password]

docker exec db sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" manage'  < backup.sql


mysql -u root -p"$MYSQL_ROOT_PASSWORD"

https://uk.godaddy.com/help/reset-your-root-mysql-password-linux-17548
