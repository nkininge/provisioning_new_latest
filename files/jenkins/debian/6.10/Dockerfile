FROM debian:6.0.10
MAINTAINER gkesavan@hortonworks.com
RUN apt-get update -y
RUN apt-get install -y python-yaml python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools python-pkg-resources git python-pip
RUN apt-get install openssh-server vim gcc python-dev sudo -y
ADD provisioning /root/provisioning
RUN mkdir /etc/ansible/
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN mkdir /opt/ansible/
RUN mkdir -p /grid/0
RUN git clone https://github.com/ansible/ansible.git /opt/ansible/ansible
WORKDIR /opt/ansible/ansible
ENV PATH /opt/ansible/ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /opt/ansible/ansible/lib
ENV ANSIBLE_LIBRARY /opt/ansible/ansible/library
WORKDIR /root/provisioning
RUN ansible-playbook --connection=local debian-slaves.yml -vvvv
RUN su - jenkins -c cd ~jenkins/; git clone git@github.com:hortonworks/HDP-UTILITIES.git --branch hdp-utils-deb ; cd HDP-UTILITIES ; sh build.sh 
