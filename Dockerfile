# our base image
FROM debian:latest

# update packages
RUN apt-get update && apt-get install -y

# install Jenkins
RUN apt-get install wget -y \
    apt-get install gnupg -y \
    apt-get install default-jre -y \
    apt-get install aptitude -y \
    wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - \
    aptitude update \
    aptitude install -y jenkins \

