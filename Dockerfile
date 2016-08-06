FROM lsiobase/alpine.nginx
MAINTAINER chbmb

# set paths
ENV WWW_ROOT="/config/www"
ENV COPS_PATH="${WWW_ROOT}/books"

# install cops
 mkdir /config/www/books/
 wget -P /tmp https://github.com/seblucas/cops/releases/download/1.0.0/cops-1.0.0.zip
 unzip -d /config/www/books/ cops-1.0.0.zip 
 
# cleanup
 rm -rfv /tmp/*
 
# install runtime packages
RUN \
 apk add --no-cache \
	php5-gd \
	php5-intl \
	php5-pdo_sqlite \
	php5-sqlite3 \
	sqlite \
	
# add local files
COPY root/ /

# ports and volumes
VOLUME /config /books
EXPOSE 80 443


