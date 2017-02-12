#!/bin/bash


while [ ! -f /var/jenkins_home/jobs/Seed/config.xml ]; do
    sleep 1
done

exec /bin/tini -- /usr/local/bin/jenkins.sh
