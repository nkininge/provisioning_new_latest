FROM REPLACE_BASE_IMAGE

RUN rpm --rebuilddb
RUN yum install -y ansible deltarpm yum-plugin-ovl

COPY . /root/ansible/

RUN localedef -i en_US -f UTF-8 en_US.UTF-8
RUN ansible-playbook /root/ansible/setup.yml -e "username=USERNAME project_name=re" -i /root/ansible/docker_files/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local
