FROM lsiobase/alpine.nginx
MAINTAINER chbmb

# set package version
ENV COPS_VER="1.0.0"

# install runtime packages
RUN \
 apk add --no-cache \
	curl \
	php5-dom \
	php5-gd \
	php5-intl \
	php5-openssl \
	php5-pdo_sqlite \
	tar

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80 443
VOLUME /config /books
