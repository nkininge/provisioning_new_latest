Provisioning Jenkins slaves
===========================
WIP

To setup Jenkins Master on Ubuntu:

1) Install Ansible 

2) clone & checkout provisioning.git:wip 

3) ansible-playbook jenkins-master.yml -i ./hosts -v 




Configure jenkins master using Ansible - http://docs.ansible.com 

1) Establish connectivity b/w the ansible control machine and the ASF jenkins slaves

2) Installing Ansible 

* http://docs.ansible.com/intro_installation.html#installation

3) Clone provision - this github repo

git clone git@github.com:hortonworks/provisioning.git

git checkout -t origin/wip -b wip

cd provisioning

4) To provision jenkins master

