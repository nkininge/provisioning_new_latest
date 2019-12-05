FROM registry.eng.hortonworks.com/sseethana/base-debian6:0.1

RUN apt-get install gcc
RUN pip install ansible==2.4.1 && ansible --version

COPY . /root/ansible/
ENV ANSIBLE_CONFIG=/root/ansible/ansible/config/ansible.cfg
RUN ansible-playbook /root/ansible/ansible/playbooks/setup-images/setup_debian6.yml  -e "username=jenkins project_name=re" -i /root/ansible/ansible/config/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local

