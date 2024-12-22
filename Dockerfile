FROM alpine:latest

RUN apk update && apk add --no-cache tor bash

CMD tor -f /etc/tor/torrc
