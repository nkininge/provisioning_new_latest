FROM REPLACE_BASE_IMAGE
RUN pip install ansible==2.9.0 && ansible --version
RUN apt-get update
RUN apt-get install unzip
COPY . /root/ansible/
ENV ANSIBLE_CONFIG=/root/ansible/ansible/config/ansible.cfg
RUN ansible-playbook /root/ansible/ansible/playbooks/setup-images/setup_ubuntu18.yml  -e "username=jenkins project_name=re" -i /root/ansible/ansible/config/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local && \
    apt-get clean
