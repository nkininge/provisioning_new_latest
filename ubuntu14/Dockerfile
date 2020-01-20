FROM REPLACE_BASE_IMAGE

RUN pip install --upgrade pip setuptools

RUN pip install ansible==2.9.0 && ansible --version

COPY . /root/ansible/

# TODO: Added by vinodkv
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -s /bin/true /sbin/initctl

ENV ANSIBLE_CONFIG=/root/ansible/ansible/config/ansible.cfg
RUN ansible-playbook /root/ansible/ansible/playbooks/setup-images/setup_ubuntu14.yml  -e "username=jenkins project_name=re" -i /root/ansible/ansible/config/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local

# TODO: Added by vinodkv
RUN rm /sbin/initctl && dpkg-divert --rename --remove /sbin/initctl
