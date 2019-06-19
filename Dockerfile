FROM ubuntu:18.04
LABEL description="Contains the tool Penelope (https://github.com/pettarin/penelope)" \
      maintainer="Thierry Nowak" \
      email="thinow@gmail.com"

RUN mkdir -p /opt/kindlegen \
             /opt/penelope

WORKDIR /opt/penelope

RUN apt-get update \
 && apt-get install -y python-pip dictzip curl \
 && rm -rf /var/lib/apt/lists/* \
 && pip install lxml marisa-trie penelope

RUN curl 'http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz' --output /tmp/kindlegen.tar.gz \
 && tar xzvf /tmp/kindlegen.tar.gz --directory /opt/kindlegen \
 && rm /tmp/kindlegen.tar.gz \
 && ln -s /opt/kindlegen/kindlegen /usr/local/bin/kindlegen

ENTRYPOINT ["penelope"]
