FROM ubuntu:14.04.3

MAINTAINER siu5 <zhangmboy@gmail.com>

RUN apt-get update && \
    apt-get install -y python-pip &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install shadowsocks==2.8.2

ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 443
ENV SS_PASSWORD passw0rd
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 500

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "/start.sh"]
