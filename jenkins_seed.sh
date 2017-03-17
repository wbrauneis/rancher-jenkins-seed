#!/bin/bash

while [ ! -f /usr/share/jenkins/rancher-seed/jobs/Seed/config.xml ]; do
    echo 'jobs/Seed/config.xml not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/.ssh/id_rsa ]; do
    echo '.ssh/id_rsa not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/jenkins-credentials.groovy ]; do
    echo 'init.groovy.d/jenkins-credentials.groovy not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/emundo-ad.groovy ]; do
    echo 'init.groovy.d/emundo-ad.groovy not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/emundo-environment-variables.groovy ]; do
    echo 'init.groovy.d/emundo-environment-variables.groovy not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/emundo-gerrit-trigger.groovy ]; do
    echo 'init.groovy.d/emundo-gerrit-trigger.groovy not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/emundo-mail.groovy ]; do
    echo 'init.groovy.d/emundo-mail.groovy not found!'
    sleep 1
done

cp -r /usr/share/jenkins/rancher-seed/.ssh /var/jenkins_home/
cp -r /usr/share/jenkins/rancher-seed/jobs /var/jenkins_home/
cp -r /usr/share/jenkins/rancher-seed/init.groovy.d /var/jenkins_home/

exec /bin/tini -- /usr/share/jenkins/rancher/jenkins.sh
