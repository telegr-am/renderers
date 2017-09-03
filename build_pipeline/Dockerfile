FROM ubuntu:16.04


RUN apt update && apt upgrade -y && \
    apt install -y python-pip

ADD chooser.py /usr/bin/chooser

RUN chmod +x /usr/bin/chooser

CMD  chooser
