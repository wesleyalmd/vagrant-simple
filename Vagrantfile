# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=666"]

  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.cpus = 1
    vb.memory = "2048"
    vb.name = "vagrant-simple"
  end

end
