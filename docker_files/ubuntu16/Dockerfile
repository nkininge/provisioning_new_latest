FROM REPLACE_BASE_IMAGE

RUN pip install ansible==1.9.2 && ansible --version

COPY . /root/ansible/

RUN ansible-playbook /root/ansible/setup.yml -e "username=USERNAME project_name=re" -i /root/ansible/docker_files/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local
