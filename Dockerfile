#Pull base image 
From tomcat:latest

# Maintainer 

CMD mkdir /usr/local/tomcat/webapp

COPY ./webapp.war /usr/local/tomcat/webapp

COPY ./webapp /usr/local/tomcat/webapps/webapp
