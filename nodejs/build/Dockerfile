FROM armhfbuild/debian:jessie
ENTRYPOINT ["/bin/bash", "-c"]


RUN apt-get update && \
    apt-get install -y --force-yes wget build-essential python python-dev software-properties-common python-software-properties && \
    apt-get install -y --force-yes curl sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

RUN apt-get install -y nodejs

RUN npm install websocket node-zip mysql request

RUN mkdir -p /opt/log && mkdir -p /opt/app

ADD run.sh /run.sh
RUN chmod 755 /*.sh


EXPOSE 8087
#WORKDIR /opt/app

CMD ["/run.sh"]
