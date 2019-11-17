FROM asciidoctor/docker-asciidoctor:latest
#FROM openjdk:8

#RUN apt update 
#RUN apt upgrade -y
#RUN apt install -y apt-transport-https

#RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

#RUN apt update && \
#    apt install -y git sbt

RUN apk add --no-cache git

ENV SCALA_VERSION=2.12.4 \
    SCALA_HOME=/usr/share/scala

 
 RUN export PATH="/usr/local/sbt/bin:$PATH" &&  apk update && apk add ca-certificates wget tar && \
    mkdir -p "/usr/local/sbt" && \
    wget -qO - --no-check-certificate "https://piccolo.link/sbt-1.3.2.tgz" | tar xz -C /usr/local/sbt --strip-components=1 && sbt sbtVersion


# git checkout tags/v0.4.2 && 

RUN export PATH="/usr/local/sbt/bin:$PATH" && \
    cd ~ && git clone https://github.com/hoisted/hoisted.git && \
    cd hoisted && \
    git checkout tags/v0.5.0 && \
    sbt assembly && \
    cp target/scala-2.12/hoisted.jar /usr/local/lib/hoisted.jar &&\
    cd ~ && rm -rf hoisted .ivy2 .sbt

COPY ./entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
