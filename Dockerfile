FROM alpine:latest

ENV BINOCS_VERSION=0.7.5

RUN APK_ARCH="$(cat /etc/apk/arch)" \
 && BINOCS_URL="binocs_${BINOCS_VERSION}_${APK_ARCH}.apk" \
 && wget https://download.binocs.sh/${BINOCS_URL} \
 && apk add --allow-untrusted ${BINOCS_URL} \
 && rm ${BINOCS_URL}

RUN binocs version \
 && ln -s /root/.binocs /config
VOLUME /config/

ENTRYPOINT [ "binocs" ]