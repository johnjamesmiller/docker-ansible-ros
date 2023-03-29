# docker-ansible-ros
running ansible in a docker to administer ROS2 based systems

ansible docker setup from https://github.com/willhallonline/docker-ansible
devcontainer setup from https://github.com/athackst/vscode_ros2_workspace

# Todo

* define inventory 
  * in inventory folder instead of default /etc/ansible/hosts 
  * or maybe map hosts file into docker? 
  * https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html
* generate an ansible.cfg file and get ansible loading from there  https://github.com/ansible/ansible/blob/devel/examples/ansible.cfg




# Ansibile config

the config file is searched fo rin the following locations
https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings-locations

    ANSIBLE_CONFIG (environment variable if set)

    ansible.cfg (in the current directory)

    ~/.ansible.cfg (in the home directory)

    /etc/ansible/ansible.cfg

