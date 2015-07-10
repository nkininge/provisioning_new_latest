Provisioning Jenkins slaves
===========================

populate ./hosts file with appropriate values 

to execute the playbook against the chosen hosts

for project re:
ansible-playbook setup.yml -e "username=jenkins project_name=re" --ask-vault-pass

for project dev:
ansible-playbook setup.yml -e "username=jenkins project_name=dev" --ask-vault-pass

