FROM alpine

LABEL \
  "name"="GitHub Pull Request Action" \
  "homepage"="https://github.com/marketplace/actions/auto-pull-request" \
  "repository"="https://github.com/offensive-vk/pull-request" \
  "maintainer"="TheHamsterBot <TheHamsterBot@users.noreply.github.com>"

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk add --no-cache git hub bash

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]
