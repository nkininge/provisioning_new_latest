New Directory Structure
=======================
Proposed Structure : 
Grouped components based on ansible roles.
If two or more roles are used by multiple components duplication of roles is done
If two or more playbooks are using same roles they are kept under the same role.
Docker files are moved under role “setup-images/files”.
Will Segregate compilable software from just installable software. 
Based on this will create multiple images one with just required software installed and one full image.


Directory Structure :
Directory structure of all components are same as setup-slaves.
	
	

├── README.md
├── Vagrantfile
├── ansible.cfg
├── docker.ini
├── images_hwx_reinfra-base.json
├── images_hwx_reinfranobody-base.json
├── inventory
│   ├── docker_hosts
│   └── hosts
├── ec2-instance
│  
├── fortify
│  
├── hive-ptest
|
├── jenkins-monitor
│  
├── jenkins-slave-monitor
│  
├── mysql
│  
├── nexus
│  
├── qe-setup
│ 
├── sensu
│  
├── setup-master
│ 
├── setup-images
│   ├── README.md
│   ├── defaults
│   │   └── main.yml
│   ├── files
│   │   ├── amazonlinux2
│   │   │   └── Dockerfile
│   │   ├── centos6
│   │   │   └── Dockerfile
│   │   ├── centos7
│   │   │   └── Dockerfile
│   │   ├── debian6
│   │   │   └── Dockerfile
│   │   ├── debian7
│   │   │   └── Dockerfile
│   │   ├── debian9
│   │   │   └── Dockerfile
│   │   ├── files
│   │   │   ├── tmpfs.conf
│   │   │   └── tmpfs.sh
│   │   ├── sles11sp1
│   │   │   └── Dockerfile
│   │   ├── sles12
│   │   │   └── Dockerfile
│   │   ├── suse11sp3
│   │   │   └── Dockerfile
│   │   ├── ubuntu12
│   │   │   └── Dockerfile
│   │   ├── ubuntu14
│   │   │   └── Dockerfile
│   │   ├── ubuntu16
│   │   │   └── Dockerfile
│   │   └── ubuntu18
│   │       └── Dockerfile
│   ├── handlers
│   │   └── main.yml
│   ├── main.yml
│   ├── meta
│   │   └── main.yml
│   ├── roles
│   │   ├── centos7
│   │   │   ├── defaults
│   │   │   │   └── main.yml
│   │   │   ├── files
│   │   │   │   ├── authorized_keys
│   │   │   │   ├── generate_256sha.sh
│   │   │   │   ├── gkesavan_id_rsa.pub
│   │   │   │   ├── hw-caching-proxy.sh
│   │   │   │   ├── jenkins_env.sh
│   │   │   │   └── limits.conf
│   │   │   ├── library
│   │   │   │   └── main
│   │   │   ├── meta
│   │   │   │   └── main
│   │   │   ├── tasks
│   │   │   │   ├── cleanup.yml
│   │   │   │   ├── download_m2.yml
│   │   │   │   ├── install_ant.yml
│   │   │   │   ├── install_gradle.yml
│   │   │   │   ├── install_gradle_351.yml
│   │   │   │   ├── install_gradle_4102.yml
│   │   │   │   ├── install_gradle_48.yml
│   │   │   │   ├── install_gradle_50.yml
│   │   │   │   ├── install_jdk10.yml
│   │   │   │   ├── install_jdk6.yml
│   │   │   │   ├── install_jdk7.yml
│   │   │   │   ├── install_jdk7_80.yml
│   │   │   │   ├── install_jdk8.yml
│   │   │   │   ├── install_jdk8_171.yml
│   │   │   │   ├── install_maven.yml
│   │   │   │   ├── install_sonar_ant_task.yml
│   │   │   │   ├── install_tools.yml
│   │   │   │   ├── main.yml
│   │   │   │   ├── mvn-gpg-nexus-password.yml
│   │   │   │   ├── npm_cleanup.yml
│   │   │   │   ├── prepare_env.yml
│   │   │   │   ├── re_readonly_update_configs.yml
│   │   │   │   ├── readonly_sshkeys.yml
│   │   │   │   ├── setup_user.yml
│   │   │   │   ├── setup_user_configs.yml
│   │   │   │   ├── setup_user_sshkeys.yml
│   │   │   │   └── update_configs.yml
│   │   │   └── vars
│   │   │       ├── dev_secrets.yml
│   │   │       ├── devci_secrets.yml
│   │   │       ├── main
│   │   │       ├── odp_secrets.yml
│   │   │       ├── re_secrets.yml
│   │   │       └── ubuntu18.yml


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
