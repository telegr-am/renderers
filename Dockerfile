FROM jekyll/minimal:3.5

RUN mkdir /input
RUN mkdir /output

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

