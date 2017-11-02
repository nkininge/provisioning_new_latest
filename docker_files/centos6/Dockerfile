FROM REPLACE_BASE_IMAGE

RUN yum install -y ansible
RUN sed -i s/1024/2048/ /etc/security/limits.d/90-nproc.conf

COPY . /root/ansible/

RUN localedef -i en_US -f UTF-8 en_US.UTF-8
RUN ansible-playbook /root/ansible/setup.yml -e "username=USERNAME project_name=re" -i /root/ansible/docker_files/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local
