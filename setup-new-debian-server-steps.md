## Login & download sysops scripts

```bash
# login to the server
ssh user@new-server-ip

# set default username

su -

# update system files and install curl to clone git repo with support scripts
apt-get update & apt-get upgrade & apt-get install curl sudo wget

# set the default username to run commands without sudo
export USERNAME_ADMIN=<<<REPLACE_WITH_YOUR_USERNAME>> 
echo "$USERNAME_ADMIN ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME_ADMIN

# install docker
apt-get -y update && apt-get -y upgrade && apt-get install -y curl

# download repo scripts
cd /usr/local/bin
curl -JLO  https://github.com/kirillus/devops.git
cd devops.git
```

## Run a init script to install packages for new server
```bash
sudo /usr/local/bin/devops.git/init-debian.sh
```
