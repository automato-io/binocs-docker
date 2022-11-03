FROM alpine:latest

ENV BINOCS_VERSION=0.7.3
RUN wget https://download.binocs.sh/binocs_${BINOCS_VERSION}_aarch64.apk \
 && apk add --allow-untrusted binocs_${BINOCS_VERSION}_aarch64.apk \
 && rm binocs_${BINOCS_VERSION}_aarch64.apk

RUN binocs version \
 && ln -s /root/.binocs /config
VOLUME /config/

ENTRYPOINT [ "binocs" ]