#!/bin/bash

while [ ! -f /usr/share/jenkins/rancher-seed/jobs/Seed/config.xml ]; do
    echo 'jobs/Seed/config.xml not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/.ssh/id_rsa ]; do
    echo '.ssh/id_rsa not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/credentials.groovy ]; do
    echo 'init.groovy.d/credentials.groovy not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/emundo-ad.groovy ]; do
    echo 'init.groovy.d/emundo-ad.groovy not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/environment-variables.groovy ]; do
    echo 'init.groovy.d/environment-variables.groovy not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/gerrit-trigger.groovy ]; do
    echo 'init.groovy.d/gerrit-trigger.groovy not found!'
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/init.groovy.d/mail.groovy ]; do
    echo 'init.groovy.d/mail.groovy not found!'
    sleep 1
done

cp -r /usr/share/jenkins/rancher-seed/.ssh /var/jenkins_home/
cp -r /usr/share/jenkins/rancher-seed/jobs /var/jenkins_home/
cp /usr/share/jenkins/rancher-seed/init.groovy.d/credentials.groovy /var/jenkins_home/init.groovy.d/credentials.groovy
cp /usr/share/jenkins/rancher-seed/init.groovy.d/emundo-ad.groovy /var/jenkins_home/init.groovy.d/emundo-ad.groovy
cp /usr/share/jenkins/rancher-seed/init.groovy.d/environment-variables.groovy /var/jenkins_home/init.groovy.d/environment-variables.groovy
cp /usr/share/jenkins/rancher-seed/init.groovy.d/gerrit-trigger.groovy /var/jenkins_home/init.groovy.d/gerrit-trigger.groovy
cp /usr/share/jenkins/rancher-seed/init.groovy.d/mail.groovy /var/jenkins_home/init.groovy.d/mail.groovy

exec /bin/tini -- /usr/share/jenkins/rancher/jenkins.sh
