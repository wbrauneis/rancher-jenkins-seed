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

while [ ! -f /usr/share/jenkins/rancher-seed/gerrit-trigger.xml ]; do
    sleep 1
done

while [ ! -f /usr/share/jenkins/rancher-seed/hudson.tasks.Mailer.xml ]; do
    sleep 1
done

cp -r /usr/share/jenkins/rancher-seed/.ssh /var/jenkins_home/
cp -r /usr/share/jenkins/rancher-seed/jobs /var/jenkins_home/
cp /usr/share/jenkins/rancher-seed/config.xml /var/jenkins_home/config.xml
cp /usr/share/jenkins/rancher-seed/credentials.xml /var/jenkins_home/credentials.xml
cp /usr/share/jenkins/rancher-seed/gerrit-trigger.xml /var/jenkins_home/gerrit-trigger.xml
cp /usr/share/jenkins/rancher-seed/hudson.tasks.Mailer.xml /var/jenkins_home/hudson.tasks.Mailer.xml

exec /bin/tini -- /usr/share/jenkins/rancher/jenkins.sh
