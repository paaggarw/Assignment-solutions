# Fetching official centos 6 image from Dockerhub.
FROM centos:centos6

# Update repos , install's dependant  packages for python 2.7. Installs JDK, mongodb.
RUN yum -y update && \
    yum groupinstall -y development && \
    yum install -y \
    bzip2-devel \
    openssl \
    openssl-devel \
    sqlite-devel \
    sudo \
    tar \
    wget \
    zlib-dev \
    java-1.7.0-openjdk-devel \
    epel-release \
    mongodb-server

# Fetches the compressed Python 2.7 file and runs its installation, Fetches Apache Tomcat 7 compresses file and uncompresses it.
RUN wget https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz && \
    tar xvfz Python-2.7.8.tgz && \
    cd Python-2.7.8 && \
    ./configure --prefix=/usr/local && \
    make && \
    make altinstall && \
    wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.79/bin/apache-tomcat-7.0.79.tar.gz && \
    tar xvfz apache-tomcat-7.0.79.tar.gz

# Sets CATALINA_HOME environment variable in container.
ENV CATALINA_HOME /Python-2.7.8/apache-tomcat-7.0.79/

#Adds tomcat.sh file from hosts current directory  to container.
ADD tomcat.sh $CATALINA_HOME/bin/tomcat.sh

#Changes the permission of script to make it executable
RUN chmod 777 $CATALINA_HOME/bin/tomcat.sh

#updates the path environment variable to point to the newly installed python 2.7
ENV PATH="/Python-2.7.8:${PATH}"

#makes the added tomcat.sh script to come in path
ENV PATH $PATH:$CATALINA_HOME/bin

#Exposes port 8080 of the container.
EXPOSE 8080

#Runs the script after building of the container.
CMD ["tomcat.sh"]

# keep the dockerfile and the script in the same folder.
# build the dockerfile as "" docker build -t assignment . ""
# run the container as "" docker run -p 7080:8080 assignment ""
