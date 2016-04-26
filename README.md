Provisioning Jenkins slaves
===========================

populate ./hosts file with appropriate values 

to execute the playbook against the chosen hosts

for project re:
ansible-playbook setup.yml -e "username=jenkins project_name=re" --ask-vault-pass

for project dev:
ansible-playbook setup.yml -e "username=xyz project_name=dev ssh_url=ssh.tar.gz"
Note: ssh_url is optional, it is used to setup ssh keys in the new environment

Contents of ssh.tar.gz
==========================
```
tar -zcvf ssh.tar.gz ssh
 ssh
 ssh/*

Tarball layout for ssh.tar.gz

tar tvf ~/.ssh.tar.gz
 .ssh/id_dsa
 .ssh/id_dsa.pub
 .ssh/id_rsa
 .ssh/id_rsa.pub
```
Note: * can be id_rsa, id_rsa.pub, id_dsa, id_dsa.pub, authorized_keys

Hosts file
===========
```
Create a hosts file under provisioning.git

cat hosts
[centos6]
<ip>

[centos6:vars]
#ansible_ssh_private_key_file=~/git/releng/build-utils/openstack-utils/accounts/hw-qe-keypair.pem
ansible_ssh_user=root
ansible_ssh_pass=vagrant

[default:children]
centos6
```

Note: Please make sure /grid/0/ directory path is created and has root ownership
