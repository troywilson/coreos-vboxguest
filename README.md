# CoreOS VirtualBox Guest Additions

[![Build Status](https://travis-ci.org/troywilson/coreos-vboxguest.svg?branch=master)](https://travis-ci.org/troywilson/coreos-vboxguest) ![Docker Image Version (latest semver)](https://img.shields.io/docker/v/troywilson/coreos-vboxguest) [![Docker Pulls](https://img.shields.io/docker/pulls/troywilson/coreos-vboxguest.svg)](https://hub.docker.com/r/troywilson/coreos-vboxguest/) ![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/troywilson/coreos-vboxguest?sort=date) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/troywilson/coreos-vboxguest/blob/master/LICENSE)

This image installs the VirtualBox Guest Additions on CoreOS Container Linux.

On startup the container interrogates the host kernel and then installs the required modules from the [troywilson/coreos-vboxguest-builder](https://github.com/troywilson/coreos-vboxguest-builder) repository. Updates are automatically handled every reboot when necessary.

## Installation
Find the docker image at: [troywilson/coreos-vboxguest](https://hub.docker.com/r/troywilson/coreos-vboxguest)

```
docker run --volume /:/root --name vboxguest --network=host --privileged \
           --restart=always --detach troywilson/coreos-vboxguest:latest
```

## Credit
Several snippets of shell code lifted from [BugRoger/coreos-nvidia-driver](https://github.com/BugRoger/coreos-nvidia-driver)
