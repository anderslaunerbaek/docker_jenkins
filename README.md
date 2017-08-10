# docker_jenkins
Creating docker for Jenkins

## Spin up a server
and install docker
```
$ apt-get update && apt-get install -y docker-ce
```


### Volumes
make a directory for storing Jenkins config files.
```
$ mkdir -p /var/jenkins_home/
```

## add plugins to Jenkins
change the plugins.txt

## run docker

### Pull lastest
```
$ docker pull anderslaunerbaek/docker_jenkins

```
###

```
$ docker run -d -p 8080:8080 -p 50000:50000 -v $PWD/var/jenkins_home:/var/jenkins_home anderslaunerbaek/docker_jenkins

```


### set up on new server...
* ssh key: Jenkins and Github
* github hook




### docker cmd
```
# Delete all containers
$ docker rm $(docker ps -a -q)
# Delete all images
$ docker rmi $(docker images -q)

```
