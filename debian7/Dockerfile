FROM REPLACE_BASE_IMAGE

RUN pip install -i https://pypi.python.org/simple/ --upgrade pip
RUN pip install -i https://pypi.python.org/simple/ cffi
RUN pip install -i https://pypi.python.org/simple/ ansible==2.4.1 && ansible --version

COPY . /root/ansible/
ENV ANSIBLE_CONFIG=/root/ansible/ansible/config/ansible.cfg
RUN ansible-playbook /root/ansible/ansible/playbooks/setup-images/setup_debian7.yml  -e "username=jenkins project_name=re" -i /root/ansible/ansible/config/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local

