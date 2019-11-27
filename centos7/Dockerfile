FROM registry.eng.hortonworks.com/hortonworks/base-centos7:0.1.0.0-82

RUN rpm --rebuilddb
RUN touch /var/lib/rpm/*
RUN yum install -y yum-plugin-ovl
RUN yum install -y ansible deltarpm

COPY . /root/ansible/

RUN localedef -i en_US -f UTF-8 en_US.UTF-8
RUN echo "Defaults !requiretty" >> /etc/sudoers
RUN ansible-playbook /root/ansible/ansible/playbooks/centos7/tasks/main.yml -e "username=jenkins project_name=re" -i /root/ansible/ansible/config//docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local
