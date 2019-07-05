#--------- Generic stuff all our Dockerfiles should start with so we get caching ------------
FROM tomcat:8.0-jre8

# prevent for interactive in apt-get
RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive
# prevent for install script to execute 
RUN  dpkg-divert --local --rename --add /sbin/initctl

# update image
RUN apt-get -y update

# upgrade curl


#Install extra fonts to use with sld font markers
RUN apt-get install -y  fonts-cantarell lmodern ttf-aenigma ttf-georgewilliams ttf-bitstream-vera ttf-sjfonts tv-fonts \
    build-essential libapr1-dev libssl-dev default-jdk 
    
#Install envsubt
RUN apt-get install -y gettext-base

#-------------Application Specific Stuff ----------------------------------------------------
ARG GS_VERSION=2.14.0
ENV GEOSERVER_DATA_DIR /opt/geoserver/data_dir
ENV ENABLE_JSONP true
ENV MAX_FILTER_RULES 20
ENV OPTIMIZE_LINE_WIDTH false
ENV GEOWEBCACHE_CACHE_DIR /opt/geoserver/data_dir/gwc
ENV GEOSERVER_OPTS "-Djava.awt.headless=true -server -Xms2G -Xmx4G -Xrs -XX:PerfDataSamplingInterval=500 \
 -Dgeoserver.xframe.shouldSetPolicy=false \
 -Dorg.geotools.referencing.forceXY=true -XX:SoftRefLRUPolicyMSPerMB=36000 -XX:+UseParallelGC -XX:NewRatio=2 \
 -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF8 -Duser.timezone=GMT -Djavax.servlet.request.encoding=UTF-8 \
 -Djavax.servlet.response.encoding=UTF-8 -Duser.timezone=GMT -Dorg.geotools.shapefile.datetime=true"
#-XX:+UseConcMarkSweepGC use this rather than parallel GC?
ENV JAVA_OPTS "$JAVA_OPTS $GEOSERVER_OPTS"
ENV GDAL_DATA /usr/local/gdal_data
ENV LD_LIBRARY_PATH /usr/local/gdal_native_libs:/usr/local/apr/lib:/opt/libjpeg-turbo/lib64
ENV GEOSERVER_LOG_LOCATION /opt/geoserver/data_dir/logs/geoserver.log
ADD logs $GEOSERVER_DATA_DIR
ENV FOOTPRINTS_DATA_DIR /opt/footprints_dir
# Unset Java related ENVs since they may change with Oracle JDK
ENV JAVA_VERSION=
ENV JAVA_DEBIAN_VERSION=
# Set JAVA_HOME to /usr/lib/jvm/default-java and link it to OpenJDK installation
RUN ln -s /usr/lib/jvm/java-8-openjdk-amd64 /usr/lib/jvm/default-java
ENV JAVA_HOME /usr/lib/jvm/default-java

WORKDIR /tmp/
ADD resources /tmp/resources
ADD scripts /scripts
RUN chmod +x /scripts/*.sh
RUN /scripts/setup.sh
ADD scripts/controlflow.properties $GEOSERVER_DATA_DIR

# Add backup directory
ADD backup /tmp/backup

# ----- ENV variable by platform
ENV CROSSORIGINFILTER /* 
# TODO
# 1) DATASTOREURL
# 2) DATASTOREUSER
# 3) DATASTOREPWD
RUN envsubst < /scripts/web.xml > /usr/local/tomcat/webapps/geoserver/WEB-INF/web.xml
# TODO
# configure the $GEOSERVER_DATA_DIR/workspaces/sixense/lot05-Compose for PostgreSQL/datastore.xml to get from ENV the correct value (envsubst)

# Clean up APT when done.
RUN echo "Yes, do as I say!" | apt-get remove --force-yes sed
RUN echo "Yes, do as I say!" | apt-get remove --force-yes login
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  \
    && dpkg --remove --force-depends  wget build-essential

# Add launch script
ADD scripts/start.sh /usr/local/tomcat/bin
RUN chmod +x /usr/local/tomcat/bin/start.sh

CMD start.sh

EXPOSE 8080/tcp