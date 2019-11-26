FROM REPLACE_BASE_IMAGE

RUN rpm --rebuilddb
RUN touch /var/lib/rpm/*
RUN yum install -y yum-plugin-ovl
RUN yum install -y ansible deltarpm

COPY . /root/ansible/

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8

RUN ansible-playbook /root/ansible/setup.yml -e "username=USERNAME project_name=re" -i /root/ansible/docker_files/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local
