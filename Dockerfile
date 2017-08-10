# our base image
FROM ubuntu:latest

# update packages
RUN apt-get update && apt-get install -y

# install RStudio
RUN apt-get install r-base \
  apt-get install r-base -y \
  apt-get install gdebi-core -y \
  apt-get install wget \
  
