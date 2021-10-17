## Login & download sysops scripts

```
# login to the server
ssh user@new-server-ip

# update system files and install curl to clone git repo with support scripts
su -
apt-get update & apt-get upgrade & apt-get install curl

# install docker
apt-get -y update && apt-get -y upgrade && apt-get install -y curl

# download repo scripts
cd /usr/local/bin
curl -JLO  https://github.com/kirillus/devops.git
cd devops.git
```

## Run a init script to install packages for new server
```
/usr/local/bin/devops.git/init-debian.sh
```
