# our base image
FROM debian:latest

# update packages
RUN apt-get update && apt-get install -y

# install libs 
RUN apt-get install wget -y 
RUN apt-get install gnupg -y 
RUN apt-get install default-jre -y 
RUN apt-get install aptitude -y
    
# install Jenkins 
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN aptitude update 
RUN aptitude install jenkins -y

# open Jenkins
