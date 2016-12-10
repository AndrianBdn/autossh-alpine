FROM alpine:3.4

ENV VERSION_AUTOSSH="1.4e"

COPY ./autossh.sh /bin/autossh.sh

RUN apk --update add --virtual build-dependencies openssh-client curl gcc make musl-dev \
  && curl -sL http://www.harding.motd.ca/autossh/autossh-$VERSION_AUTOSSH.tgz | tar xvz -C /tmp \
  && cd /tmp/autossh-$VERSION_AUTOSSH \
  && ./configure \
  && make \
  && cp ./autossh /usr/bin/autossh \
  && cp ./autossh.host /autossh.host.example \
  && curl -o /usr/bin/dumb-init -L https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 \
  && chmod 755 /usr/bin/dumb-init \
  && apk del build-dependencies gcc curl musl-dev \
  && apk add openssh-client \
  && rm -rf /tmp/* \
  && rm -rf /var/cache/apk/* \
  && chmod 755 /bin/autossh.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh"]
