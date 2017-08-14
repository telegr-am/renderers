FROM jekyll/minimal:3.5

# Install tools we'll need 
RUN sudo apk update
RUN sudo apk add git
RUN sudo apk add jq
RUN sudo apk upgrade

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

