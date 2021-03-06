FROM ubuntu

        MAINTAINER Quinten MARUTHIGOWDA <maruthi.v@bizruntime.com>

        # make sure the package repository is up to date

        RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

        RUN apt-get update && apt-get -y install python-software-properties

        RUN add-apt-repository ppa:webupd8team/java

        RUN apt-get update && apt-get -y upgrade

        # automatically accept oracle license

        RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

        # and install java 7 oracle jdk

        RUN apt-get -y install oracle-java7-installer && apt-get clean

        RUN update-alternatives --display java

        RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment

        #install the tomcat7

        RUN apt-get -y install tomcat7

        RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/default/tomcat7

        EXPOSE 8080

