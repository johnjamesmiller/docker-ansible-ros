# docker-ansible-ros
Running ansible in a docker to administer ROS2 based systems

# Credits
* Ansible docker setup from https://github.com/willhallonline/docker-ansible
* devcontainer setup from https://github.com/athackst/vscode_ros2_workspace

# getting started
* check this code out
* open with vscode
* add your robots to the inventory/robots
* make sure you can ssh to all your robots without a password. See SSH config below.
* use re-open in container option to launch the docker container
* run `ansible all --list-hosts` to make sure ansible are picking up your hosts
* run `ansible all -m ping` to make sure you can connect to all the hosts

# Todo

* map in ssh
* install developers public ssh keys to all robots

# Things I want to be able to do

* make sure all the robots have the right docker image.
* make sure the robots have the right debian packages.
* make sure the robtos have the right configs


# Inventory

Target machines are specified in /ansible/inventory/robots

The ansible process knows to look here because of the inventory setting specified in ansible.cfg

# SSH config

* follow tutorials online for generating ssh keys. 
** You probably want to protect your personal ssh key with a passphrase
** for the key you use for ansible you will either want to leave the key unprotected or use ssh-agent
* `ssh-copy-id username@robot` to copy your public key to the authorized_keys file on each remote system
* now make sure you can `ssh username@robot` to the robots without entering password


# Ansibile config

Config generated with `ansible-config init --disabled -t all > ansible.cfg` and lives in /ansible/ansible.cfg inside the container.

The config location is given to the ansible process via environment variable ANSIBLE_CONFIG specified in the Dockerfile.

By default the ansible process searches for the config file the following locations

* ANSIBLE_CONFIG (environment variable if set)
* ansible.cfg (in the current directory)
* ~/.ansible.cfg (in the home directory)
* /etc/ansible/ansible.cfg

https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings-locations

