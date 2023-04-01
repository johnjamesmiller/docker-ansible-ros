# docker-ansible-ros
Running ansible in a docker to administer ROS2 based systems

Ansible docker setup from https://github.com/willhallonline/docker-ansible

devcontainer setup from https://github.com/athackst/vscode_ros2_workspace

# Todo

* map in ssh
* install developers public ssh keys to all robots


# Inventory

Target machines are specified in /ansible/inventory/robots

The ansible process knows to look here because of the inventory setting specified in ansible.cfg


# Ansibile config

Config generated with `ansible-config init --disabled -t all > ansible.cfg` and lives in /ansible/ansible.cfg inside the container.

The config location is given to the ansible process via environment variable ANSIBLE_CONFIG specified in the Dockerfile.

By default the ansible process searches for the config file the following locations

* ANSIBLE_CONFIG (environment variable if set)
* ansible.cfg (in the current directory)
* ~/.ansible.cfg (in the home directory)
* /etc/ansible/ansible.cfg

https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings-locations

