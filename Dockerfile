FROM lsiobase/alpine.nginx
MAINTAINER chbmb

# set package version
ENV COPS_VER="1.0.0"

# install runtime packages
RUN \
 apk add --no-cache \
	php5-dom \
	php5-gd \
	php5-intl \
	php5-opcache \
	php5-openssl \
	php5-pdo_sqlite

# install cops
RUN \
 apk add --no-cache --virtual=build-dependencies \
	curl \
	tar && \
 curl -o \
 /tmp/cops.tar.gz -L \
	"https://github.com/seblucas/cops/archive/${COPS_VER}.tar.gz" && \
 mkdir -p \
	/usr/share/webapps/cops && \
 tar xf /tmp/cops.tar.gz -C \
	/usr/share/webapps/cops --strip-components=1 && \

# cleanup
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config /books
