FROM lsiobase/alpine.nginx:3.5
MAINTAINER chbmb

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# set package version
ENV COPS_VER="1.0.1"

# install runtime packages
RUN \
 apk add --no-cache \
	php7-dom \
	php7-gd \
	php7-intl \
	php7-opcache \
	php7-openssl \
	php7-pdo_sqlite \
	php7-zlib

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
