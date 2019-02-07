FROM alpine:3.7

RUN apk update && apk add --no-cache fontconfig curl curl-dev msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f && \
    apk add --no-cache wget nodejs && \
    wget -qO- "https://github.com/dustinblackman/phantomized/releases/download/2.1.1a/dockerized-phantomjs.tar.gz" | tar xz -C /

WORKDIR /usr/src/app
COPY . .
RUN npm install phantomjs-prebuilt && npm install
ENTRYPOINT ["node", "index.js"]
