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
tar -zcvf ssh.tar.gz ssh
 ssh
 ssh/*

Note: * can be id_rsa, id_rsa.pub, id_dsa, id_dsa.pub, authorized_keys

