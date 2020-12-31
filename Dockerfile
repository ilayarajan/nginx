# Pull base image 
From tomcat:latest

# Maintainer 

COPY ./webapps /usr/local/tomcat/webapps
