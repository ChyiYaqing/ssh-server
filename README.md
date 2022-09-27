# SSH Server
> Docker Image for running OpenSSH server. Can be used in combination with sshuttle for creating a secure network connection to a docker cluster

# SetUp

```
# 所有操作通过Makefile
$ make             

You can use this image to running in Docker or kubernetes

Usage:
  make <target>...

Build image
  build_image            Build ssh-server image
  publish_image          Push ssh-server image to docker hub

Kubectl

Helm
  helm_install           helm install ssh-server charts
  helm_template          helm template ssh-server charts to yaml
  helm_delete            helm delete ssh-server charts

# 部署ssh-server 到k8s的命名空间
make helm_install

# 卸载ssh-server
make helm_delete

# 本机ssh连接到pod, 端口使用NodePort端口, IP使用集群Node IP
ssh -o 'PubkeyAcceptedKeyTypes +ssh-rsa' -i ~/.ssh/id_rsa -p 31181 root@192.168.50.57
```
