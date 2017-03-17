FROM rancher/confd:v0.12.0-alpha3

ADD ./jenkins_seed.sh /usr/share/jenkins/rancher-seed/jenkins.sh
ADD ./noop.txt /usr/share/jenkins/rancher-seed/.ssh/noop.txt
ADD ./noop.txt /usr/share/jenkins/rancher-seed/init.groovy.d/noop.txt
ADD ./noop.txt /usr/share/jenkins/rancher-seed/jobs/Seed/noop.txt

VOLUME /usr/share/jenkins/rancher-seed

ENTRYPOINT ["confd"]

CMD ["--backend", "rancher", "--prefix", "/2015-07-25"]