ARG TAG="latest"

FROM alpine:$TAG

RUN set -e; \
    apk add --no-cache \
      openssl git make curl nodejs npm; \
    npm i -g yarn

COPY ./install /tmp/install

WORKDIR /tmp/install

RUN set -e; \
    sh ./kubectl.sh; \
    sh ./helm.sh

WORKDIR /tmp

RUN rm -fr /tmp/install

USER nobody

ENV HOME="/tmp"

ENTRYPOINT [ "sh" ]
CMD [ "-c", "echo 'Sleeping...'; while true; do sleep 1; done" ]
