FROM registry.eng.hortonworks.com/sseethana/base-sles11sp1:0.5

RUN zypper rr ARTIFACTS && zypper ar http://172.22.77.245/TD-repo/ hosted_sp1
RUN zypper refresh && zypper install -y wget yaml

#RUN zypper remove -y ansible python-crypto

RUN wget http://dev.hortonworks.com.s3.amazonaws.com/ARTIFACTS/suse11sp3/ansible-1.9.4-41.1.x86_64.rpm && \
    rpm -ivh ansible-1.9.4-41.1.x86_64.rpm && rm -rf ansible-1.9.4-41.1.x86_64.rpm
    #wget http://dev.hortonworks.com.s3.amazonaws.com/ARTIFACTS/suse11sp3/python-pycrypto-2.6-2.2.x86_64.rpm && \
   # rpm -ivh python-pycrypto-2.6-2.2.x86_64.rpm && rm -rf python-pycrypto-2.6-2.2.x86_64.rpm

COPY . /root/ansible/

RUN ansible-playbook /root/ansible/setup.yml -e "username=USERNAME project_name=re" -i /root/ansible/docker_files/docker_hosts --vault-password-file=/root/ansible/re_vault_pass.txt --connection=local
