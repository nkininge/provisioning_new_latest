This playbook is a wrapper on top of mysql ansible playbook to create fortify database setup. In this playbook we assume mysql is already up and running.

1. Update/verify the values specified in vars/mysql.yml

Command: ansible-playbook -s -u root setup_fortify.yml --vault-password-file roles/fortify/vault_password.txt 
