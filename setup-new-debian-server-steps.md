## Login & download sysops scripts

```
# login to the server
ssh user@new-server-ip

# update system files and install curl to clone git repo with support scripts
su -
apt-get update & apt-get upgrade & apt-get install curl

# install docker
apt-get -y update && apt-get -y upgrade && apt-get install -y curl git wget

# make nopassword access to the server from your computer
```
ssh-keygen -b 2048 -t rsa
# copy & past a public key from public computer to server ( get it from ~/.ssh/id_rsa.pub ) 
vi ~/.ssh/authorized_keys
chmod +600 ~/.ssh/authorized_keys
```


# download repo scripts
git clone  https://github.com/kirillus/devops.git /usr/local/bin/devops
cd /usr/local/bin/devops
```

## Run a init script to install packages for new server
```
/usr/local/bin/devops/init-debian.sh
```
  
