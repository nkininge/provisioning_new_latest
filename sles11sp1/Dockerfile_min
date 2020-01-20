FROM REPLACE_BASE_IMAGE

RUN zypper rr ARTIFACTS && zypper ar http://172.22.77.245/TD-repo/ hosted_sp1
RUN zypper refresh && zypper install -y wget yaml

#RUN zypper remove -y ansible python-crypto

RUN wget http://dev.hortonworks.com.s3.amazonaws.com/ARTIFACTS/suse11sp3/ansible-1.9.4-41.1.x86_64.rpm && \
    rpm -ivh ansible-1.9.4-41.1.x86_64.rpm && rm -rf ansible-1.9.4-41.1.x86_64.rpm
    #wget http://dev.hortonworks.com.s3.amazonaws.com/ARTIFACTS/suse11sp3/python-pycrypto-2.6-2.2.x86_64.rpm && \
   # rpm -ivh python-pycrypto-2.6-2.2.x86_64.rpm && rm -rf python-pycrypto-2.6-2.2.x86_64.rpm

COPY . /root/ansible/
ENV ANSIBLE_CONFIG=/root/ansible/ansible/config/ansible.cfg
RUN ansible-playbook /root/ansible/ansible/playbooks/setup-images/setup_sles11sp1.yml  -e "username=jenkins project_name=re" -i /root/ansible/ansible/config/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local

