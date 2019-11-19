FROM REPLACE_BASE_IMAGE

RUN pip install -i https://pypi.python.org/simple/ --upgrade pip
RUN pip install -i https://pypi.python.org/simple/ cffi
RUN pip install -i https://pypi.python.org/simple/ ansible==2.4.1 && ansible --version

COPY . /root/ansible/

RUN ansible-playbook /root/ansible/setup.yml -e "username=USERNAME project_name=re" -i /root/ansible/docker_files/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local
