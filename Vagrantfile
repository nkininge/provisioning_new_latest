# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/6"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.synced_folder "grid", "/grid"

  config.vm.provision "shell", inline: <<-SHELL
    yum -y install epel-release
    yum -y install ansible libselinux libselinux-python python-pip
  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    echo =========================================================
    echo  SSH into vagrant node and run the following commands:
    echo =========================================================
    echo cd /vagrant
    echo ansible-playbook -c local -v \
      -e username=vagrant \
      -e project_name=dev \
      -e home_base_dir=/home \
      -e build_user_uid=999 \
      -e url_download_key="<INSERT_PASSWORD_HERE>" \
      setup.yml
    echo =========================================================
  SHELL
end
