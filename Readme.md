# Basic Docker commands:

List running container:
```docker
    docker ps
```

Ssh into a container:
```docker
    docker exec -it <container name> /bin/sh
```

Build a Docker image from a Dockerfile
```docker
    docker build -t image_name .
```

Run a Docker container
```docker
    docker run image_name
```

Check docker daemon disk space usage
```docker
    docker system df
```

# Commands for Docker Network
List networks:
```docker
    docker network ls
```

Connects a container to a network:
```docker
    docker network connect <network> <container>
```

Disconnect a container from a network:
```docker
    docker network disconnect <network> <container>
```

# Clean Docker:
Remove all images:
```docker
    docker rmi $(docker images)
```

Destroy all containers:
```docker
    docker rm $(docker ps -a)
```

Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes.
```docker
    docker system prune
```

Remove all unused volumes
```docker
    docker volume prune
```
Remove all containers, networks, containers and volume:
```docker
    docker system prune -af
```

# Run nginx container separatl:

Build the container with: 
```docker
    docker build -t image_name .
```

Run the nginx container:
```docker
    docker run --name [nameofyourcontainer] -p 80:80 -d [nameofyourimage]
```
# Usefull link

https://mariadb.com/kb/en/creating-a-custom-docker-image/



# Run docker without sudo
```docker
sudo usermod -aG docker ${USER}

```

```docker
su -${USER}

```