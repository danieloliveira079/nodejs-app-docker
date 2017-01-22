FROM node:6.3

MAINTAINER Daniel Oliveira

# explicitly set user/group IDs
RUN set -x \
	&& groupadd -r baphomet --gid=1000 \
	&& useradd -r -g baphomet --uid=1000 baphomet

  ENV GOSU_VERSION 1.9
  RUN set -x \
      && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
      && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
      && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
      && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
      && export GNUPGHOME="$(mktemp -d)" \
      && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
      && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
      && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
      && chmod +x /usr/local/bin/gosu \
      && gosu nobody true \
      && apt-get purge -y --auto-remove ca-certificates wget

ENV HOST 0.0.0.0
ENV PORT 7001
ENV NODE_ENV production

EXPOSE $PORT

HEALTHCHECK --interval=60s --timeout=5s --retries=5 CMD curl -f http://localhost:$PORT/ || exit 1

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN npm install -g yarn
RUN yarn

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
