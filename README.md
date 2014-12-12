# Openstack on Docker

This is a fork of ewindisch/dockenstack project for building DevStack with Docker. Unlike the original project, which is focusing on nova-docker CI testing with OpenStack trunk, this fork is trying to:

* Ease the burden of DevStack setup. Consume less time and generate consistent ready-to-use environment.
* Easy to switch DevStack environment with different configuration setup. This is because of Docker's container nature.
* Never mess up with your local dev environment.

Dockenstack contains Docker artifacts to build images for DevStack environment. As of now it contains fake driver and single node setup, which is generally enough for OpenStack control plane dev and test purpose. More setup configurations are also in the plan.

* single node setup with fake virt driver, nova-network (unicell/devstack-fake)

## TODO

* single node setup with other virt driver options
* multi node setup
* cell setup
* neutron setup with SDN controller included

The quick iteration cycle of dockenstack versus other local environments (such as devstack-vagrant) is accomplished by precaching and preinstalling most or all network resources and OS packages. This speeds up running the container and, when running many, eliminates the problems that might result from offline or rate-limited apt and pip services.

Users may expect dockenstack to take 5-10 minutes on a fast machine from "docker run" through having an operational OpenStack installation.

# Build & Run

## Tryout with prebuilt image from Docker Hub public registry

Run following command to start DevStack env with default setup. First time run requires additional time to pull down image from the repository.

```
docker run --privileged -t -i unicell/devstack-fake
```

## Build your own image

WARNING: This takes a while. (~30 minutes)

devstack-base is the one contains all the prebuilt packages, code repos, 3rd party libraries. For building an image with only DevStack's own localrc changed, one can skip the base image, and simply build dependent images.

```
git clone https://github.com/unicell/dockenstack.git
cd dockenstack
docker build -t unicell/devstack-base docker/devstack-base
```

```
docker build -t unicell/devstack-fake docker/devstack-fake
docker run --privileged -t -i unicell/devstack-fake
```

# Using DevStack

If you've started dockenstack interactively without extra arguments, you'll end up with a shell and can run these steps immediately.

```
source /devstack/openrc admin admin
nova boot --flavor 84 --image cirros-0.3.2-x86_64-uec test
nova list
```

# Environment Variables

Dockenstack should understand all of the devstack environment variables.
 
# Notes

* Requires Docker 1.0 or later.
* AUFS / Volumes - Using AUFS and nested-docker, one may need to mount /var/lib/docker as a volume or a bind-mount. (pass '-v /var/lib/docker' to 'docker run')
* Libvirt guests may need kernel modules loaded. If these are not already loaded in the host, you may wish to bind-mount /lib/modules into the container using 'docker run -v /lib/modules:/lib/modules'

# Authors

* Qiu Yu <unicell@gmail.com>
* Eric Windisch <ewindisch@docker.com>
* Paul Czarkowski

# License

Apache2 - see `LICENSE`
