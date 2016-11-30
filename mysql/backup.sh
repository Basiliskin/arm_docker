#!/bin/bash 

docker stop db;docker rm db;
sudo rm  bak.tar.gz
sudo tar zcvf bak.tar.gz data
./run.sh