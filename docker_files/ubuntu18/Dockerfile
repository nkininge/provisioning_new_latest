FROM registry.eng.hortonworks.com/hortonworks/base-ubuntu18:0.1-testing
RUN pip install ansible==2.4.1 && ansible --version
RUN apt-get update
RUN apt-get install unzip
COPY . /root/ansible/

RUN ansible-playbook /root/ansible/setup.yml -e "username=USERNAME project_name=re" -i /root/ansible/docker_files/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local -vvvv && \
    apt-get clean
