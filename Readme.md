# About Docker and Docker-compose

Docker is used to manage individual container on the docker engine.
Docker-compose is used to manage a multi-container application. It works like a "script" on top of Docker.

A docker container image is a lightweight, sandlestone exectutable package of software that includes everything needed to run an application.

The key difference between the docker Dockerfile and docker-compose is that the docker Dockerfile describes how to build Docker images, while docker-compose is used to run Docker containers.

# Difference between Vm and Docker

Virtual machines have host OS and the guest OS inside each VM. Guest OS can be any OS, like Linux or Windows, irrespective of host OS.
Virtual machines are needed if the applications or services required to run on different OS. 

Docker containers host on a single physical server with a host OS, which shares among them. Sharing the host OS between containers makes them light and increases the boot time. 
Docker containers are considered suitable to run multiple applications over a single OS kernel.

![](https://cloudacademy.com/wp-content/uploads/2019/10/Docker-vs..png)

# Create new user 
```bash
sudo adduser login
```
```bash
sudo usermod -aG sudo login
```
```bash
sudo usermod -aG docker login
```
# Basic Docker commands:

### List running container:
```docker
    docker ps
```

### Ssh into a container:
```docker
    docker exec -it <container name> /bin/sh
```

### Run container with interactive shell:
```docker
    docker run -it wp
```

### Build a Docker image from a Dockerfile
```docker
    docker build -t image_name .
```

### Run a Docker container
```docker
    docker run image_name
```

### Check docker daemon disk space usage
```docker
    docker system df
```

# Commands for Docker Network
List networks:
```docker
    docker network ls
```

### Connects a container to a network:
```docker
    docker network connect <network> <container>
```

### Disconnect a container from a network:
```docker
    docker network disconnect <network> <container>
```

# Clean Docker:
### Remove all images:
```docker
    docker rmi $(docker images)
```

### Destroy all containers:
```docker
    docker rm $(docker ps -a)
```

### Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes.
```docker
    docker system prune
```

### Remove all unused volumes
```docker
    docker volume prune
```
### Remove all containers, networks, containers and volume:
```docker
    docker system prune -af
```

# Run nginx container separatl:

### Build the container with: 
```docker
    docker build -t image_name .
```

### Run the nginx container:
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

# if this error -> "ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)"

```bash
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld

```

# Show db and tables
### To connect to mysql remotely using your database user:
```bash
mysql -h 127.0.0.1 -u wp -p (password: wp42)
```

### To show that the database is not empty:
```bash
show databases;
```
```bash
use wordpress;
```

```bash
show tables;
```

### Show comments
```mysql
SELECT * FROM wp_comments
```

Then you need to connect as admin to your wp website and approuve the comments or they won't appears at restart etc...