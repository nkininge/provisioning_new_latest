FROM registry.eng.hortonworks.com/hortonworks/base-ubuntu18:0.1.0.0-92
RUN pip install ansible==2.9.0 && ansible --version
RUN apt-get update
RUN apt-get install unzip
COPY . /root/ansible/

RUN ansible-playbook /root/ansible/setup-images/main.yml -e "username=jenkins project_name=re" -i /root/ansible/inventory/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local -vvvv && \
    apt-get clean
