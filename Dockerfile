FROM ubuntu:18.04
LABEL description="Contains the tool Penelope (https://github.com/pettarin/penelope)" \
      maintainer="Thierry Nowak" \
      email="thinow@gmail.com"

RUN mkdir -p /opt/penelope
WORKDIR /opt/penelope

COPY resources/extracted/kindlegen /opt/kindlegen
RUN ln -s /opt/kindlegen/kindlegen /usr/local/bin/kindlegen

RUN apt-get update \
 && apt-get install -y python-pip dictzip \
 && rm -rf /var/lib/apt/lists/* \
 && pip install "penelope>=3.1.0.0,<3.2.0.0"

ENTRYPOINT ["penelope"]
