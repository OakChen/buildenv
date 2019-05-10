# Build environment for Android

A series of docker image to build Android source. When we use newest OS, it may not be able to build lower version Android, the docker works here.

## Download from Docker Hub

    docker pull oakchen/buildenv:tag

## Usage

    docker run -it -v /path/to/source_root:/path/in/docker oakchen/buildenv:Android-5.x bash

Then, change to source directory, following normal Android build steps.

You can leave the container running in the background by pressing CTRL+P, then CTRL+Q. If you leave the container running in the background, you can return by command

`docker attach CONTAINER_ID`

then press ENTER or CTRL+C.



If you type `exit` in the container, the container is terminated, but you can reuse it by:

`docker start CONTAINER_ID`

`docker attach CONTAINER_ID`

