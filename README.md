# docker_jenkins
Creating docker for Jenkins

## 
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
$ docker run -d -p 8080:8080 -p 50000:50000 -v $PWD/jenkins_home:/var/jenkins_home anderslaunerbaek/docker_jenkins

```


### set up on new server...
* ssh key:
* github hook
