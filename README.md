# CoreOS VirtualBox Guest Additions

[![Build Status](https://travis-ci.org/troywilson/coreos-vboxguest.svg?branch=master)](https://travis-ci.org/troywilson/coreos-vboxguest)


This image installs the VirtualBox Guest Additions on CoreOS Container Linux.

On startup the container interrogates the host kernel and then installs the required modules from the [troywilson/coreos-vboxguest-builder](https://github.com/troywilson/coreos-vboxguest-builder) repository. Updates are automatically handled every reboot when necessary.

## Installation
Find the docker image at: [troywilson/coreos-vboxguest](https://hub.docker.com/r/troywilson/coreos-vboxguest)

```
docker run -v /:/root --privileged --restart=always troywilson/coreos-vboxguest:latest
```

## Credit
Several snippets of shell code lifted from [BugRoger/coreos-nvidia-driver](https://github.com/BugRoger/coreos-nvidia-driver)
