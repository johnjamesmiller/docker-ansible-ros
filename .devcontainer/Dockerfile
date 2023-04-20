FROM willhallonline/ansible:ubuntu
# From https://github.com/willhallonline/docker-ansible
# and https://github.com/athackst/vscode_ros2_workspace

#https://docs.formant.io/reference/fctl
ENV DEBIAN_FRONTEND=noninteractive
RUN . /etc/os-release
RUN apt-key adv --fetch-keys https://keys.formant.io/formant.pub.gpg
RUN echo "deb https://repo.formant.io/formant/debian jammy main" | tee -a /etc/apt/sources.list >/dev/null
RUN apt-get update \
   && apt-get -y install --no-install-recommends fctl \
   #
   # Clean up
   && apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog

ENV ANSIBLE_CONFIG=/ansible/ansible.cfg

COPY ../requirements.yml /tmp/
RUN ansible-galaxy collection install -r /tmp/requirements.yml

# Set up auto-source of workspace for ros user
ARG WORKSPACE
# RUN echo "if [ -f ${WORKSPACE}/install/setup.bash ]; then source ${WORKSPACE}/install/setup.bash; fi" >> /home/ros/.bashrc
