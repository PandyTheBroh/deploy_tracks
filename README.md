# deploy_tracks
A Chef's cookbook repository for a DevOps job test

# Summary
This cookbook will help you to deploy the Ruby on Rails application [Tracks](http://www.getontracks.org/) behind a nginx reverse proxy (**COMMING SOON**).

# Compatibility
This cookbook only have been tested under a Ubuntu 14.04 LTS node. Maybe it could works on other versions, but I can't guarantee it.

# Prerequisites
This cookbook has the next dependencies:
* [the oficial apt cookbook of opscode](https://github.com/chef-cookbooks/apt).
* [the oficial tar cookbook of opscode](https://github.com/chef-cookbooks/tar)

To satisfice this dependencies, you can add this cookbooks in the run_list of your node or run `berks install` to download them from Supermarket into the cache.

# Versions
* Chef Development Kit Version: 2.0.28
* chef-client version: 13.2.20
* berks version: 6.2.0
* kitchen version: 1.16.0
* inspec version: 1.31.1
* Docker version 17.05.0-ce, build 89658be

# Testing
This cookbook has a functional kitchen file (.kitchen.yml) to deploy and testing under a Docker machine based in Ubuntu 14.04 Lts. The driver used is [kitchen-dokken, the semioficial test-kitchen plugin to usage Docker](https://github.com/someara/kitchen-dokken).

This machine has binded the **3000** (rails server) and **80** (nginx) ports on host ports **3001** and **8080**.

## Usage
* Run pulls (if missing) the chef/chef image from the Docker hub and creates a volume container named chef-<version>.

```bash
kitchen create
```
* Deploy the cookbook inside the container and keep it running:

```bash
time kitchen converge
```
* Login into the running container

```bash
kitchen login deploy-tracks-ubuntu-1404
```

* Destroy the container:

```bash
kitchen destroy deploy-tracks-ubuntu-1404
```

For more information about this topic:
* [The documentaion of Opscode about kitchen](https://docs.chef.io/ctl_kitchen.html)
* ["How it works" of the kitchen-dokken repo](https://github.com/someara/kitchen-dokken#how-it-works)
