#!/bin/bash
mkdir -p ~/.ssh
cp -r /root/.ssh-from-host/* ~/.ssh/
chown -R $(id -u):$(id -g) ~/.ssh

mkdir -p ~/.formant
cp -r /root/.formant-from-host/.user ~/.formant/
chown -R $(id -u):$(id -g) ~/.formant