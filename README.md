# deploy_tracks
A Chef's cookbook repository for a DevOps job test

# Summary
This cookbook will help you to deploy the Ruby on Rails application [Tracks](http://www.getontracks.org/) (**COMMING SOON**).

# Compatibility
This cookbook only have been tested under a Ubuntu 14.04 LTS node. Maybe it could works on other versions, but I can't guarantee it.

# Prerequisites
This cookbook assume that your node has updated the list of package repositories. The best way to guarantee it, it's that your run_list launch before of this cookbook [the oficial apt cookbook of opscode](https://github.com/chef-cookbooks/apt)

# Versions
* Chef Development Kit Version: 2.0.28
* chef-client version: 13.2.20
* berks version: 6.2.0
* kitchen version: 1.16.0
* inspec version: 1.31.1

# Testing
This cookbook has a functional kitchen file (.kitchen.yml) to deploy and testing under a Docker machine based in Ubuntu 14.04 Lts. The driver used is [kitchen-dokken, the oficial test-kitchen plugin to usage Docker](https://github.com/someara/kitchen-dokken)

## Usage
* Deploy the cookbook inside the container:

```bash
kitchen converge deploy-tracks-ubuntu-1404
```
* Login into the running container

```bash
kitchen login deploy-tracks-ubuntu-1404
```

* Destroy the container:

```bash
kitchen destroy deploy-tracks-ubuntu-1404
```

For more information about this topic, read [the documentaion of Opscode about kitchen](https://docs.chef.io/ctl_kitchen.html)
