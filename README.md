# docker jenkins image
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

## Add plugins to Jenkins
add all nedded plugins to plugins.txt. There are currently following:
* ssh-agent
* lockable-resources

## Run docker
pull lastest version:
```
$ docker pull anderslaunerbaek/docker_jenkins

```
run Jenkins docker in deatched mode.

```
$ docker run -d -p 8080:8080 -p 50000:50000 -v $PWD/var/jenkins_home:/var/jenkins_home anderslaunerbaek/docker_jenkins

```

## What to do on a new server
setup following things:
* generate ssh keys and insert them in Jenkins and Github
* enable github hook on github

## Create new job


### Jekinsfile
inspiration from [Link](https://gist.github.com/sofusalbertsen/bc277c393c1b522d74121a91ec8bce8b).


## Docker cmds 
```
# Delete all containers
$ docker rm $(docker ps -a -q)
# Delete all images
$ docker rmi $(docker images -q)

```
