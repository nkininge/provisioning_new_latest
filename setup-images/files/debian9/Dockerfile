FROM registry.eng.hortonworks.com/hortonworks/base-debian9.3:0.1.0.0-92

RUN pip install -i https://pypi.python.org/simple/ --upgrade pip
RUN pip install -i https://pypi.python.org/simple/ cffi
RUN pip install -i https://pypi.python.org/simple/ ansible==2.9.0 && ansible --version

COPY . /root/ansible/

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8

RUN ansible-playbook /root/ansible/setup-images/main.yml -e "username=jenkins project_name=re" -i /root/ansible/inventory/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local
