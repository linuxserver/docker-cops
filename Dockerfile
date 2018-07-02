FROM lsiobase/alpine.nginx:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="chbmb"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	curl \
	tar && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	php7-ctype \
	php7-dom \
	php7-gd \
	php7-intl \
	php7-mbstring \
	php7-opcache \
	php7-openssl \
	php7-phar \
	php7-pdo_sqlite \
	php7-zip \
	php7-zlib && \
 echo "**** install composer ****" && \
 ln -sf /usr/bin/php7 /usr/bin/php && \
 curl \
    -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/bin --filename=composer && \
 composer \
	global require "fxp/composer-asset-plugin:~1.1" && \
 echo "**** install cops ****" && \
 COPS_VER=$(curl -sX GET "https://api.github.com/repos/seblucas/cops/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]') && \
 curl -o \
 /tmp/cops.tar.gz -L \
	"https://github.com/seblucas/cops/archive/${COPS_VER}.tar.gz" && \
 mkdir -p \
	/usr/share/webapps/cops && \
 tar xf /tmp/cops.tar.gz -C \
	/usr/share/webapps/cops --strip-components=1 && \
 cd /usr/share/webapps/cops && \
 composer \
	install --no-dev --optimize-autoloader && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.composer \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config /books
