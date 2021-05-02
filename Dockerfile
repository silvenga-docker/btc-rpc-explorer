FROM node:14
WORKDIR /app

LABEL maintainer "Mark Lopez <m@silvenga.com>"
LABEL org.opencontainers.image.source https://github.com/silvenga-docker/btc-rpc-explorer

RUN set -xe \
    && apt-get update \
    && apt-get install -y git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && git clone https://github.com/janoside/btc-rpc-explorer.git /app \
    && git checkout v3.1.1 \
    && npm install

CMD npm start
EXPOSE 3002
