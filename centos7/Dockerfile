FROM REPLACE_BASE_IMAGE

RUN rpm --rebuilddb
RUN touch /var/lib/rpm/*
RUN yum install -y yum-plugin-ovl
RUN yum install -y ansible deltarpm

COPY . /root/ansible/
ENV ANSIBLE_CONFIG=/root/ansible/ansible/config/ansible.cfg
RUN localedef -i en_US -f UTF-8 en_US.UTF-8
RUN echo "Defaults !requiretty" >> /etc/sudoers
RUN ansible-playbook /root/ansible/ansible/playbooks/setup-images/setup_centos7.yml  -e "username=jenkins project_name=re" -i /root/ansible/ansible/config/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local
