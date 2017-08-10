# our base image
#FROM debian:latest
#
# update packages
#RUN apt-get update && apt-get install -y
#
# install libs 
#RUN apt-get install wget -y 
#RUN apt-get install gnupg -y 
#RUN apt-get install default-jre -y 
#RUN apt-get install aptitude -y
#    
# install Jenkins 
#RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
#RUN aptitude update 
#RUN aptitude install jenkins -y
#
## open Jenkins



FROM ubuntu:14.04
 
RUN apt-get update && apt-get install -y wget git curl
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-7-jdk
RUN apt-get update && apt-get install -y maven ant ruby rbenv make
RUN echo "1.554.3" > .lts-version-number


RUN wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -
RUN echo deb http://pkg.jenkins-ci.org/debian-stable binary/ >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y jenkins
RUN mkdir -p /var/jenkins_home && chown -R jenkins /var/jenkins_home

ADD init.groovy /tmp/WEB-INF/init.groovy
RUN apt-get install -y zip && cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/init.groovy
USER jenkins

# install plugins
FROM jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# VOLUME /var/jenkins_home - bind this in via -v if you want to make this persistent.
ENV JENKINS_HOME /var/jenkins_home

# for main web interface:
EXPOSE 8080 

# will be used by attached slave agents:
EXPOSE 50000 
CMD ["/usr/bin/java",  "-jar",  "/usr/share/jenkins/jenkins.war"]
