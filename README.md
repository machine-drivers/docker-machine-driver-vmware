# Docker machine vmware driver

This is a docker machine driver for VMware Fusion and Workstation.

## How to consume this driver

### Prerequisite
Make sure you have VMware Workstation 14 (Windows/Linux) or VMware Fusion 10 (MacOS)
installed on your machine. Earlier versions of Workstation/Fusion might still work
with this driver, but it's not officially supported.

### Install
For MacOS and Linux, make sure `$GOPATH/bin` is part of your `$PATH` for MacOS and Linux.
For Windows, make sure `%GOPATH%\bin` is included in `%PATH%`.

Run the following command:

```shell
go get -u github.com/machine-drivers/docker-machine-driver-vmware
```

if the `PATH` is correctly setup, you will see this if you run the command

```shell
$ docker-machine-driver-vmware
This is a Docker Machine plugin binary.
Plugin binaries are not intended to be invoked directly.
Please use this plugin through the main 'docker-machine' binary.
(API version: 1)
```

### Usage
The driver can be consumed by `docker-machine`, or potentially other tools that are
compatible to docker machine drivers like `minikube` (not supported yet). For
`docker-machine`, create a docker machine is simply a command like this:

```shell
$ docker-machine create --driver=vmware default
```

## Difference between driver vmwarefusion
Docker machine has a builtin driver called `vmwarefusion`. The main difference between
those drivers is that `vmware` also works on VMware Workstation, while `vmwarefusion` only
works on VMware Fusion.

## License

It's under the Apache 2 license.
