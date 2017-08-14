FROM jekyll/minimal:3.5

# Install tools we'll need 
RUN sudo apk update
RUN sudo apk add 'git<2.12'
RUN sudo apk add 'jq<1.6'
RUN sudo apk upgrade

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

