# docker-ansible-ros
Running ansible in a docker to administer ROS2 based systems using formant as the vpn

# Credits
* Ansible docker setup from https://github.com/willhallonline/docker-ansible
* devcontainer setup from https://github.com/athackst/vscode_ros2_workspace
# Getting started
* check this code out
* open with vscode
* add your robots to the inventory/robots
* make sure you can ssh to all your robots without a password. See SSH config below.
* use re-open in container option to launch the docker container
* run `ansible all --list-hosts` to make sure ansible are picking up your hosts
* run `ansible all -m ping` to make sure you can connect to all the hosts

# Todo

* Install developers public ssh keys to all robots. 
  * https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html
  * maybe pull straight from github? https://api.github.com/users/johnjamesmiller/keys
* Manage docker containers from ansible 
  * https://docs.ansible.com/ansible/2.9/modules/docker_container_module.html
  * https://galaxy.ansible.com/community/docker
  * https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_module.html#ansible-collections-community-docker-docker-compose-module
* Get package list from test machine and update prod machines to match
  * https://groups.google.com/g/ansible-project/c/hzjGPityybs
  * https://stackoverflow.com/questions/66371349/getting-a-list-of-differences-between-list-of-installed-packages-and-list-of-des
* Review ros2 specific playbooks. what to include and how?
  * https://galaxy.ansible.com/rarrais/ros
  * https://github.com/rarrais/ansible-role-ros2
  * https://github.com/swarmBots-ipa/ansible_automation/tree/main/tasks
  * https://gitlab.oit.duke.edu/devil-ops/ansible-ros-desktop
  * https://git.sr.ht/~mynameiscosmo/ansible-role-ros-install
  * https://github.com/BrettRD/ros2-playbooks
* Clean up ssh with ssh agent or better solution on user id.
  * https://stackoverflow.com/questions/34932490/inject-hosts-ssh-keys-into-docker-machine-with-docker-compose
  * https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
* launch devcontainer with non root user https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
* Support more VPNs



# Things I want to be able to do

* make sure all the robots have the right docker image.
* make sure the robots have the right debian packages.
* make sure the robtos have the right configs


# Inventory

Target machines are specified in /ansible/inventory/robots

The ansible process knows to look here because of the inventory setting specified in ansible.cfg

# SSH config

* `ssh-keygen`
*  * You probably want to protect your personal ssh key with a passphrase
* * for the key you use for ansible you will either want to leave the key unprotected or use ssh-agent
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

