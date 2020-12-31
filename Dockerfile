#Pull base image 
From tomcat:latest

# Maintainer 

COPY ./webapp.war /usr/local/tomcat/webapp

COPY ./webapps /usr/local/tomcat/webapps/webapp
