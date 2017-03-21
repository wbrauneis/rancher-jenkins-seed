#!/bin/bash

while [ ! -f /usr/share/jenkins/rancher-seed/jobs/Seed/config.xml ]; do
    echo 'jobs/Seed/config.xml not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/config.groovy ]; do
    echo 'init.groovy.d/config.groovy not found!'
    sleep 1
done

cp -r /usr/share/jenkins/rancher-seed/jobs /var/jenkins_home/
cp -r /usr/share/jenkins/rancher-seed/init.groovy.d /var/jenkins_home/

exec /bin/tini -- /usr/share/jenkins/rancher/jenkins.sh
