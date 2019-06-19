FROM alpine:3.9

RUN apk update \
 && apk add g++ \
            python-dev \
            libxml2 \
            libxml2-dev \
            libxslt-dev \
            py-pip \
 && pip install penelope
