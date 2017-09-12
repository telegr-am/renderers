FROM ubuntu:16.04

RUN apt update && apt upgrade -y && \
    apt install -y curl vim emacs

ENV SERVERLESS_VERSION=1.21.1

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x > node_install.sh
RUN chmod +x ./node_install.sh
RUN ./node_install.sh
RUN apt update
RUN apt install -y apt-utils
RUN apt install -y nodejs

# Install serverless cli
RUN npm install serverless@$SERVERLESS_VERSION -g

ADD boot.sh /usr/bin/boot.sh

RUN chmod +x /usr/bin/boot.sh

CMD "boot.sh"



