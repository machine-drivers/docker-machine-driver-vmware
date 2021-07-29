# Docker Machine VMware Driver

Create Docker machines locally on VMware [Fusion](https://www.vmware.com/products/fusion)
and [Workstation](https://www.vmware.com/products/workstation).

This driver requires VMware Workstation 14 (Windows/Linux) or VMware Fusion 10 (macOS)
to be installed on your host. Earlier versions of Workstation/Fusion might still work
with this driver, but it's not officially supported.

>
> Docker machine has a builtin driver called `vmwarefusion`. The main difference between
> those drivers is that `vmware` also works on VMware Workstation, while `vmwarefusion` only
> works on VMware Fusion.
>

## License

The Docker Machine VMware Driver is released under the [Apache License 2.0](https://github.com/machine-drivers/docker-machine-driver-vmware/blob/master/LICENSE) license, for more information see LICENSE or https://www.apache.org/licenses/LICENSE-2.0

## Installation

### From a Release

The latest version of the `docker-machine-driver-vmware` binary is available on the
[GitHub Releases](https://github.com/machine-drivers/docker-machine-driver-vmware/releases) page.
Download the binary that corresponds to your OS into a directory residing in your PATH.

### From Homebrew

The driver is available for easy installation via Homebrew on macOS.

```shell
$ brew install docker-machine-driver-vmware
```

### From Source

Make sure you have installed [Go](http://www.golang.org) and configured [GOPATH](http://golang.org/doc/code.html#GOPATH)
properly. For MacOS and Linux, make sure `$GOPATH/bin` is part of your `$PATH` for MacOS and Linux.
For Windows, make sure `%GOPATH%\bin` is included in `%PATH%`.

Run the following command:

```shell
go get -u github.com/machine-drivers/docker-machine-driver-vmware
```


## Usage

```shell
$ docker-machine create --driver=vmware default
```


## Options

- `--vmware-boot2docker-url`: URL for boot2docker image
- `--vmware-configdrive-url`: URL for cloud-init configdrive
- `--vmware-cpu-count`: Number of CPUs for the machine (-1 to use the number of CPUs available)
- `--vmware-disk-size`: Size of disk for host VM (in MB)
- `--vmware-memory-size`: Size of memory for host VM (in MB)
- `--vmware-network-type`: Network connection type to use (e.g. 'nat', 'bridged', 'hostonly')
- `--vmware-no-share`: Disable the mount of your home directory
- `--vmware-ssh-password`: SSH password
- `--vmware-ssh-user`: SSH user
- `--vmware-wait-ip`: Time to wait for vmrun to get an ip (in milliseconds)

#### Environment variables and default values

| CLI option                 | Environment variable   | Default                  |
|----------------------------|------------------------|--------------------------|
| `--vmware-boot2docker-url` | VMWARE_BOOT2DOCKER_URL | *Latest boot2docker url* |
| `--vmware-configdrive-url` | VMWARE_CONFIGDRIVE_URL | -                        |
| `--vmware-cpu-count`       | VMWARE_CPU_COUNT       | `1`                      |
| `--vmware-disk-size`       | VMWARE_DISK_SIZE       | `20000`                  |
| `--vmware-memory-size`     | VMWARE_MEMORY_SIZE     | `1024`                   |
| `--vmware-network-type`    | VMWARE_NETWORK_TYPE    | `nat`                    |
| `--vmware-no-share`        | VMWARE_NO_SHARE        | -                        |
| `--vmware-ssh-password`    | VMWARE_SSH_PASSWORD    | `tcuser`                 |
| `--vmware-ssh-user`        | VMWARE_SSH_USER        | `docker`                 |
| `--vmware-wait-ip`         | VMWARE_WAIT_IP         | `30000`                  |
