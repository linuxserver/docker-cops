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
	php5-pdo_sqlite \
	tar
 
 apk add —no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing \
	mini-sendmail
	
# add local files
COPY root/ /

# ports and volumes
VOLUME /config /books
EXPOSE 80 443
