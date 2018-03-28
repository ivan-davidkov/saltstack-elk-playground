# "saltstack-elk-playground"
This repo contains a working version of the massively popular Elasticsearch, Logstash, and Kibana a.k.a. ELK. It is intended to help you get fast a salt-stack + elk testing environment. Important these containers are intended for interactive use there is no `init`, `systemd`, `SysV`, `upstart` or even `tinit`. Basically not good for Production :). It is rather for educational purpose that I created this repo. That been said nothing stops you to enrich the containers and make them production ready.

## requirements
... docker
... docker-compose
... internet access
... openssl

## usage
... clone this repo
```console
git clone https://github.com/ivan-davidkov/saltstack-elk-playground.git
```
... generate certificates for nginx different services (used as frontend proxy for kibana and cerebro)
```console
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout master/srv/salt/file/base/linux/apps/kibana/nginx-conf/ssl/kibana.key \
-out master/srv/salt/file/base/linux/apps/kibana/nginx-conf/ssl/kibana.crt
```
... do the same for logstash
```console
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout master/srv/salt/file/base/linux/apps/logstash/config/ssl/logstash.key \
-out master/srv/salt/file/base/linux/apps/logstash/config/ssl/logstash.crt
```

## starting all containers
... `docker-compose` can start one or more containers depending on your needs eg.
```console
docker-compose -f master.yml -f logstash.yml -f kibana.yml -f elastic.yml up
```
... docker-compose will build the containers on your first execution, you you want to change anything related to the containers you will need to use the `--build`.
... if you want to clean the environment and start from scratch delete the repo and clone again.

## once the containers are running
... you can see if docker and its containers are running useing the following command
```console
docker ps
```
... you can connect to your saltstack master interactively with this command
```console
docker exec -it master bash
```
... [inside the container] after the first execution you need to accept all the minions. You docker-compose will start showing errors like:
```console
Attaching to master, elasticsearch, kibana, logstash
elasticsearch    | [ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
kibana           | [ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
logstash         | [ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
```
... the above errors are self-explanatory, Basically you need  to accept the minions keys. [inside the container] you show first list minions keys '-L' and accept these keys '-A'
```console
containerID $ salt-key -L
Accepted Keys:
Denied Keys:
Unaccepted Keys:
elasticsearch
kibana
logstash
Rejected Keys:
containerID $ salt-key -A
The following keys are going to be accepted:
Unaccepted Keys:
elasticsearch
kibana
logstash
Proceed? [n/Y] Y
Key for minion elasticsearch accepted.
Key for minion kibana accepted.
Key for minion logstash accepted.
```
... [inside the container] once all minions keys are accepted by the master you can now play with your salt formulas. start by testing the communications b/w master and minions, then lets state logstash :)
```console
containerID $ salt '*' test.ping
containerID $ salt 'kibana' state.apply
```

... if you need to start the stack you will need to "enter" each container and run the respective daemon. eg.

*OPEN one terminal per container*

```console
Host $ docker exec -it kibana bash
containerID # /usr/share/kibana/bin/kibana
```

```console
Host $ docker exec -it logstash bash
containerID # /usr/share/logstash/bin/logstash

```
... Elasticsearch will give you an error like: [This account is currently not available.] so you need st start with a `su` parameters
```console
Host $ docker exec -it elasticsearch bash
containerID # su -l elasticsearch -s /usr/share/elasticsearch/bin/elasticsearch
```

## enjoy poking around
