FROM REPLACE_BASE_IMAGE
 
RUN pip install -i https://pypi.python.org/simple/ ansible==2.4.1 && ansible --version

COPY . /root/ansible/

# TODO: Added by vinodkv
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -s /bin/true /sbin/initctl

RUN ansible-playbook /root/ansible/setup.yml -e "username=USERNAME project_name=re" -i /root/ansible/docker_files/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local

# TODO: Added by vinodkv
RUN rm /sbin/initctl && dpkg-divert --rename --remove /sbin/initctl
