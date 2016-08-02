FROM lsiobase/alpine.nginx
MAINTAINER chbmb

# set paths
ENV WWW_ROOT="/config/www"
ENV COPS_PATH="${WWW_ROOT}/cops"

# install build-dependencies
RUN \
 apk add --no-cache --virtual=build-dependencies \
	#####

# uninstall build-dependencies
 apk del --purge \
	build-dependencies && \

# cleanup
 rm -rfv /tmp/*
 
# install runtime packages
RUN \
 apk add --no-cache \
	php5-sqlite \
	php5-gd \
	php5-intl \
	
# add local files
COPY root/ /

# ports and volumes
VOLUME /config /data
EXPOSE 80 443

# set nextcloud version
ENV COPS_VER="1.0.0"
