Provisioning Jenkins slaves
===========================

Configure slaves using Ansible - http://docs.ansible.com 

1) Establish connectivity b/w the ansible control machine and the ASF jenkins slaves

2) Installing Ansible 

* http://docs.ansible.com/intro_installation.html#installation

3) Clone provision - this github repo

git clone git@github.com:hortonworks/provision.git

git checkout -t origin/master -b master

cd provision

4) run ansible-playbook 

ansible-playbook -i hosts init.yml  -v 
