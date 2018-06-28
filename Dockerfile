FROM node:alpine
COPY . /tmp/src

ENV NODE_ENV=development
RUN apk add --no-cache -t build-deps make gcc g++ python ca-certificates libc-dev wget git \
    && cd /tmp/src \
    && npm install \
    && mv src / \
    && mv config / \
    && mv node_modules / \
    && mv twitter-as.js /twitter-as.js \
    && cd / \
    && rm -rf /tmp/* \
    && apk del build-deps

ENV NODE_ENV=production

CMD node twitter-as.js -p 9000 -c /data/config.yaml -f /data/twitter-registration.yaml

EXPOSE 9000
VOLUME ["/data"]