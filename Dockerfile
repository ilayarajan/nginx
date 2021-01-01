FROM tomcat:jdk8

WORKDIR /opt/tomcat

# Remove default-apps and move cuurent directory for first deploy only, uncomment below and run
RUN mv /usr/local/tomcat/* /opt/tomcat/

#RUN rm -rf /usr/local/tomcat/*

# hide ServerInfo in production
#ADD ./webapp.war /opt/tomcat/webapps/
#ADD ./webapp/ /opt/tomcat/webapps/

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.41
ENV CATALINA_HOME /opt/tomcat/
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE

RUN umask 0001

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]

EXPOSE 8080
