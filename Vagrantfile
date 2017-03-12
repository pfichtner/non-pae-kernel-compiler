# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/box/virtualbox/ubuntu1610-i386-0.1.0.box"
  config.vm.provision "shell", path: "compile-kernel.sh"
end

