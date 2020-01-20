FROM REPLACE_BASE_IMAGE

RUN pip install -i https://pypi.python.org/simple/ --upgrade pip
RUN pip install -i https://pypi.python.org/simple/ cffi
RUN pip install -i https://pypi.python.org/simple/ ansible==2.9.0 && ansible --version

COPY . /root/ansible/

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8
ENV ANSIBLE_CONFIG=/root/ansible/ansible/config/ansible.cfg
RUN ansible-playbook /root/ansible/ansible/playbooks/setup-images/setup_debian9.yml  -e "username=jenkins project_name=re" -i /root/ansible/ansible/config/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local

