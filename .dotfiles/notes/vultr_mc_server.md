## Deploy VULTR server

Deploy a new VULTR server with server image "Docker" from marketplace apps at https://my.vultr.com/deploy/.

## Log in to VULTR server first time

On local computer:

```sh
MC_SERVER_IP=...
ssh -o StrictHostKeyChecking=no root@$MC_SERVER_IP
```

## Initial config for VULTR server

On server:

```sh
git init
git remote add origin https://github.com/sigurdo/dotfiles.git
git fetch
git checkout -f main
git submodule update --init --recursive

apt update
apt install -y zsh exa
snap install bottom
snap install zellij --classic
chsh -s $(which zsh)
```

## Upload server data

On local computer:

```sh
scp server_data.tar.gz root@$MC_SERVER_IP:~/
```

## Log into VULTR surver in zellij session through screen (for persistence)

On local computer:

```sh
ssh -o StrictHostKeyChecking=no -o RequestTTY=yes root@$MC_SERVER_IP screen -D -RR -S zellij zellij attach --create
```

## Update duckdns domain

On server:

```sh
DUCKDNS_DOMAIN=...
DUCKDNS_TOKEN=...
curl "https://www.duckdns.org/update?domains=$DUCKDNS_DOMAIN&token=$DUCKDNS_TOKEN"
```

## Extract server data

On server:

```sh
tar -xzf server_data.tar.gz
```

## Start minecraft server with docker

On server:

```sh
docker run -it -p 25565:25565 -e EULA=TRUE -e MEMORY=28G -e MOTD="Sigurd er kul ass" -e DIFFICULTY=hard -e ALLOW_FLIGHT=true -e VIEW_DISTANCE=32 -e TYPE=PAPER --rm -v ./data:/data --name mc itzg/minecraft-server
```

## Compress and download server data

On server:

```sh
tar -czf server_data.tar.gz data
```

On local computer:

```sh
scp root@$MC_SERVER_IP:~/server_data.tar.gz ./
```
