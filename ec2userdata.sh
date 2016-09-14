#!/bin/sh
export PATH=/usr/local/bin:$PATH;

yum update
yum install docker -y
yum install git -y
service docker start
# Docker login notes:
#   - For no email, just put one blank space.
#   - Also the private repo protocol and version are needed for docker
#     to properly setup the .dockercfg file to work with compose
docker login --username="someuser" --password="asdfasdf" --email=" " https://example.com/v1/
mv /root/.dockercfg /home/ec2-user/.dockercfg
chown ec2-user:ec2-user /home/ec2-user/.dockercfg
usermod -a -G docker ec2-user
curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
chown root:docker /usr/local/bin/docker-compose
