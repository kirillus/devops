#!/bin/bash

echo "Setup Debian packages for the dev ops"
USERNAME=${1:-admin}


# Install default apps
apt-get install -y vim

# Install bat instead cat
apt install bat
rm -rf ~/.local/bin ~/.local/bin/bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# install lsd instead ls
#wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb -qO temp.deb && dpkg -i temp.deb
#apt-get remove lsd
#wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb -qO temp.deb && dpkg -i temp.deb
rm -rf ./temp.deb


# install handy aliases
DIR_ALIASES=/.bashrc_aliases
rm -rf $DIR_ALIASES 
touch $DIR_ALIASES 
chown -R $USERNAME.$USERNAME $DIR_ALIASES 
cat > $DIR_ALIASES << ALIASES
# ls
alias ls='/usr/bin/lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ll='la'

# Start the docker-compose stack in the current directory
alias dcu="docker-compose up -d"

# Start the docker-compose stack in the current directory and rebuild the images
alias dcub="docker-compose up -d --build"

# Stop, delete (down) or restart the docker-compose stack in the current directory
alias dcs="docker-compose stop"
alias dcd="docker-compose down"
alias dcr="docker-compose restart"

# Show the logs for the docker-compose stack in the current directory
# May be extended with the service name to get service-specific logs, like
# 'dcl php' to get the logs of the php container
alias dcl="docker-compose logs"

# Quickly run the docker exec command like this: 'dex container-name bash'
#alias dex="docker exec -it"
dex() {
    docker exec -it "$1" /bin/bash
    echo "$1"
}

dl() {
    docker logs --tail 100 -f "$1"
}

#'docker ps' displays the currently running containers
alias dps="docker ps --format 'table {{ .ID }}\t{{ .Names }}\t{{ .Ports }}\t{{ .Status }}'"

# This command is a neat shell pipeline to stop all running containers no matter
# where you are and without knowing any container names
alias dsa="docker ps -q | awk '{print $1}' | xargs -o docker stop"

alias vi='vim'

ALIASES
source /home/$USERNAME/.bashrc
