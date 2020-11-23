# Build environment for Allwinner T507 Linux

A series of docker image to build embedded platforms.

## Download from Docker Hub

    docker pull oakchen/buildenv:tag

## Usage

    docker run -it -v /path/to/source_root:/path/in/docker oakchen/buildenv:tag bash

Here tag can be zm-t507-linux. Typically, you can map /home in host to /home in docker, then, you can add group and user as the same as host before you build the source:

```
groupadd -g id gname # you can get group/user name and id by id command in your host
useradd -d /home/uname -M -g gname -s /bin/bash uname
su uname # Switch to the user
```

After group and user are created, switch user, change to source directory, following normal build steps.

Even, you can map passwd and group to docker, then you don't need to create user and group.

```bash
docker run -it -v /path/to/source_root:/path/in/docker -v /etc/group:/etc/group -v /etc/passwd:/etc/passwd oakchen/buildenv:tag bash
```

You can leave the container running in the background by pressing CTRL+P, then CTRL+Q. If you leave the container running in the background, you can return by command

`docker attach CONTAINER_ID`

then press ENTER or CTRL+C.



If you type `exit` in the container, the container is terminated, but you can reuse it by:

`docker start CONTAINER_ID`

`docker attach CONTAINER_ID`

