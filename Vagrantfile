# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "packer/box/virtualbox/ubuntu1610-kernelcompiler-i386-0.1.0.box"
  #config.vm.provision "shell", path: "compile-kernel.sh"
  #config.vm.provision "shell", inline: "cp -ax /usr/src/*.deb /vagrant/"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end 
end

