FROM openjdk:8 AS base

RUN apt update && apt upgrade -y && \
    apt install -y apt-transport-https

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt update && \
    apt install -y git sbt

RUN mkdir hoisted

COPY hoisted/build.sbt hoisted/

RUN mkdir hoisted/project

COPY hoisted/project hoisted/project

WORKDIR hoisted

RUN sbt assembly

WORKDIR /

COPY hoisted hoisted

WORKDIR hoisted

RUN sbt assembly && \
    cp target/scala-2.12/hoisted.jar /usr/local/lib/hoisted.jar &&\
    cd ~ && rm -rf hoisted .ivy2 .sbt

COPY ./entrypoint.sh /usr/bin/entrypoint.sh

FROM openjdk:alpine

COPY --from=base /usr/local/lib/hoisted.jar /usr/local/lib/hoisted.jar
COPY --from=base /usr/bin/entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
