#!/bin/bash


while [ ! -f /usr/share/jenkins/rancher-seed/config.xml ]; do
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/jobs/Seed/config.xml ]; do
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/credentials.xml ]; do
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/.ssh/id_rsa ]; do
    sleep 1
done

exec /bin/tini -- /usr/share/jenkins/rancher/jenkins.sh
