#Pull base image 
From tomcat:latest

# Maintainer 

COPY ./webapp.war /usr/local/tomcat/webapps

COPY ./webapps /usr/local/tomcat/webapps/webapp
