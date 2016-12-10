# autossh-alpine

Docker container based on Alpine Linux with OpenSSH and autossh. 

I use it to do remote port forwarding from a container. 

Usage (from Docker Compose): 

```yaml 

version: '2'
services:
  autossh:
    restart: unless-stopped
    image: andrianbdn/autossh-alpine
    volumes:
      - ./keys:/root/keys
    command: autossh.sh -o "StrictHostKeyChecking=no" -R 10443:192.168.4.22:443 -R 1080:192.168.4.22:80 -i /root/keys/sshgate sshgate@172.217.20.174

```
