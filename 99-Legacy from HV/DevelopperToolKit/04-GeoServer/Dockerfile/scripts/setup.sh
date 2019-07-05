#!/usr/bin/env bash
if [ ! -d ${GEOSERVER_DATA_DIR} ];
then
    echo "Creating geoserver data directory"
    mkdir -p ${GEOSERVER_DATA_DIR}
else
    echo "Geoserver data directory already exist"
fi

if [ ! -d ${FOOTPRINTS_DATA_DIR} ];
then
    echo "Creating geoserver footprints directory"
    mkdir -p ${FOOTPRINTS_DATA_DIR}
else
    echo "Geoserver  footprints directory already exist"
fi

pushd /tmp/resources

work_dir=`pwd`

if [ ! -d ${work_dir}/plugins ];
 then
     echo "Creating tmp plugins directory"
     mkdir -p ${work_dir}/plugins
 else
     echo "tmp plugins directory already exist"
 fi

pushd ${work_dir}/plugins
# Download Geoserver Extensions
# Vector tiles
wget -c https://tenet.dl.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/extensions/geoserver-${GS_VERSION}-vectortiles-plugin.zip -O geoserver-${GS_VERSION}-vectortiles-plugin.zip
# CSS styling
wget -c https://tenet.dl.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/extensions/geoserver-${GS_VERSION}-css-plugin.zip -O geoserver-${GS_VERSION}-css-plugin.zip
#CSW
wget -c https://tenet.dl.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/extensions/geoserver-${GS_VERSION}-csw-plugin.zip -O geoserver-${GS_VERSION}-csw-plugin.zip
# WPS
wget -c https://tenet.dl.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/extensions/geoserver-${GS_VERSION}-wps-plugin.zip -O geoserver-${GS_VERSION}-wps-plugin.zip
# Printing plugin
wget -c https://tenet.dl.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/extensions/geoserver-${GS_VERSION}-printing-plugin.zip -O geoserver-${GS_VERSION}-printing-plugin.zip
#libjpeg-turbo
wget -c https://tenet.dl.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/extensions/geoserver-${GS_VERSION}-libjpeg-turbo-plugin.zip -O geoserver-${GS_VERSION}-libjpeg-turbo-plugin.zip
#Control flow
wget -c https://sourceforge.net/projects/geoserver/files/GeoServer/${GS_VERSION}/extensions/geoserver-${GS_VERSION}-control-flow-plugin.zip/download -O geoserver-${GS_VERSION}-control-flow-plugin.zip
#Image pyramid
wget -c https://sourceforge.net/projects/geoserver/files/GeoServer/${GS_VERSION}/extensions/geoserver-${GS_VERSION}-pyramid-plugin.zip/download -O geoserver-${GS_VERSION}-pyramid-plugin.zip
#GDAL
wget -c https://sourceforge.net/projects/geoserver/files/GeoServer/${GS_VERSION}/extensions/geoserver-${GS_VERSION}-gdal-plugin.zip/download -O geoserver-${GS_VERSION}-gdal-plugin.zip
#Backup Restore Community plugins
wget -c https://build.geoserver.org/geoserver/2.14.x/community-latest/geoserver-2.14-SNAPSHOT-backup-restore-plugin.zip -O geoserver-${GS_VERSION}-backup-restore-plugin.zip

if [ ! -d gdal ];
then
    echo "Creating gdal  directory"
    mkdir -p gdal
fi

# Install Geoserver prerequisit : Geospatial Data Abstraction Library
pushd gdal
wget -c http://demo.geo-solutions.it/share/github/imageio-ext/releases/1.1.X/1.1.15/native/gdal/gdal-data.zip
popd
wget -c http://demo.geo-solutions.it/share/github/imageio-ext/releases/1.1.X/1.1.15/native/gdal/linux/gdal192-Ubuntu12-gcc4.6.3-x86_64.tar.gz

popd

# Install libjpeg-turbo for that specific geoserver GS_VERSION
if [ ! -f /tmp/resources/libjpeg-turbo-official_1.5.3_amd64.deb ]; then \
    wget https://tenet.dl.sourceforge.net/project/libjpeg-turbo/1.5.3/libjpeg-turbo-official_1.5.3_amd64.deb -P /tmp/resources;\
    fi; \
    cd /tmp/resources/ && \
    dpkg -i libjpeg-turbo-official_1.5.3_amd64.deb


# Install tomcat APR
if [ ! -f /tmp/resources/apr-1.6.3.tar.gz ]; then \
    wget -c wget  http://mirror.za.web4africa.net/apache//apr/apr-1.6.3.tar.gz \
      -P /tmp/resources; \
    fi; \
    tar -xzf /tmp/resources/apr-1.6.3.tar.gz -C /tmp/resources/ && \
    cd /tmp/resources/apr-1.6.3 && \
    touch libtoolT && ./configure && make -j 4 && make install

# Install tomcat native
if [ ! -f /tmp/resources/tomcat-native-1.2.16-src.tar.gz ]; then \
    wget -c http://mirror.za.web4africa.net/apache/tomcat/tomcat-connectors/native/1.2.16/source/tomcat-native-1.2.16-src.tar.gz \
      -P /tmp/resources; \
    fi; \
    tar -xzf /tmp/resources/tomcat-native-1.2.16-src.tar.gz -C /tmp/resources/ && \
    cd /tmp/resources/tomcat-native-1.2.16-src/native && \
    ./configure --with-java-home=${JAVA_HOME} --with-apr=/usr/local/apr && make -j 4 && make install

pushd /tmp/

# force Java Advanced Image library & Image I/O than geoserver native one for better performance 
 if [ ! -f /tmp/resources/jai-1_1_3-lib-linux-amd64.tar.gz ]; then \
    wget http://download.java.net/media/jai/builds/release/1_1_3/jai-1_1_3-lib-linux-amd64.tar.gz -P /tmp/resources;\
    fi; \
    if [ ! -f /tmp/resources/jai_imageio-1_1-lib-linux-amd64.tar.gz ]; then \
    wget http://download.java.net/media/jai-imageio/builds/release/1.1/jai_imageio-1_1-lib-linux-amd64.tar.gz -P /tmp/resources;\
    fi; \
    mv ./resources/jai-1_1_3-lib-linux-amd64.tar.gz ./ && \
    mv ./resources/jai_imageio-1_1-lib-linux-amd64.tar.gz ./ && \
    gunzip -c jai-1_1_3-lib-linux-amd64.tar.gz | tar xf - && \
    gunzip -c jai_imageio-1_1-lib-linux-amd64.tar.gz | tar xf - && \
    mv /tmp/jai-1_1_3/lib/*.jar $JAVA_HOME/jre/lib/ext/ && \
    mv /tmp/jai-1_1_3/lib/*.so $JAVA_HOME/jre/lib/amd64/ && \
    mv /tmp/jai_imageio-1_1/lib/*.jar $JAVA_HOME/jre/lib/ext/ && \
    mv /tmp/jai_imageio-1_1/lib/*.so $JAVA_HOME/jre/lib/amd64/ && \
    rm /tmp/jai-1_1_3-lib-linux-amd64.tar.gz && \
    rm -r /tmp/jai-1_1_3 && \
    rm /tmp/jai_imageio-1_1-lib-linux-amd64.tar.gz && \
    rm -r /tmp/jai_imageio-1_1

pushd $CATALINA_HOME

# Get geoserver war and install it in Tomcat
if [ ! -f /tmp/resources/geoserver-${GS_VERSION}.zip ]; then \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/geoserver-${GS_VERSION}-war.zip \
      -O /tmp/resources/geoserver-${GS_VERSION}.zip; \
    fi; \
    unzip /tmp/resources/geoserver-${GS_VERSION}.zip -d /tmp/geoserver \
    && unzip /tmp/geoserver/geoserver.war -d $CATALINA_HOME/webapps/geoserver \
    && cp -r $CATALINA_HOME/webapps/geoserver/data/user_projections $GEOSERVER_DATA_DIR \
    && rm -rf $CATALINA_HOME/webapps/geoserver/data \
    && rm -rf /tmp/geoserver

# Install any plugin zip files in resources/plugins
if ls /tmp/resources/plugins/*.zip > /dev/null 2>&1; then \
      for p in /tmp/resources/plugins/*.zip; do \
        unzip $p -d /tmp/gs_plugin \
        && mv /tmp/gs_plugin/*.jar $CATALINA_HOME/webapps/geoserver/WEB-INF/lib/ \
        && rm -rf /tmp/gs_plugin; \
      done; \
    fi; \
    if ls /tmp/resources/plugins/*gdal*.tar.gz > /dev/null 2>&1; then \
    mkdir /usr/local/gdal_data && mkdir /usr/local/gdal_native_libs; \
    unzip /tmp/resources/plugins/gdal/gdal-data.zip -d /usr/local/gdal_data && \
    tar xzf /tmp/resources/plugins/gdal192-Ubuntu12-gcc4.6.3-x86_64.tar.gz -C /usr/local/gdal_native_libs; \
    fi;

# Install jetty servlet for CORS
if [ ! -f /tmp/resources/jetty-servlets-9.4.9.v20180320.jar ]; then \
    wget -c wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-servlets/9.4.9.v20180320/jetty-servlets-9.4.9.v20180320.jar \
      -P /tmp/resources; \
    fi; \
    mv /tmp/resources/jetty-servlets-9.4.9.v20180320.jar $CATALINA_HOME/webapps/geoserver/WEB-INF/lib/
if [ ! -f /tmp/resources/jetty-util-9.4.9.v20180320.jar ]; then \
    wget -c wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-util/9.4.9.v20180320/jetty-util-9.4.9.v20180320.jar \
      -P /tmp/resources; \
    fi; \
    mv /tmp/resources/jetty-util-9.4.9.v20180320.jar $CATALINA_HOME/webapps/geoserver/WEB-INF/lib/

# Remove Tomcat manager, docs, and examples
rm -rf $CATALINA_HOME/webapps/ROOT && \
rm -rf $CATALINA_HOME/webapps/docs && \
rm -rf $CATALINA_HOME/webapps/examples && \
rm -rf $CATALINA_HOME/webapps/host-manager && \
rm -rf $CATALINA_HOME/webapps/manager; \

# Delete resources after installation
rm -rf /tmp/resources
