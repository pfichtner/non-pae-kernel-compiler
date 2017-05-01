# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "packer/box/virtualbox/ubuntu1704-kernelcompiler-i386-0.1.0.box"
  #config.vm.provision "shell", path: "compile-kernel.sh"
  #config.vm.provision "shell", inline: "cp -ax /usr/src/*.deb /vagrant/"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end 

  if Vagrant.has_plugin?("vagrant-proxyconf")
    puts "proxyconf..."
    if ENV["http_proxy"]
      puts "http_proxy: " + ENV["http_proxy"]
      config.proxy.http   = ENV["http_proxy"]
    end
    if ENV["https_proxy"]
      puts "https_proxy: " + ENV["https_proxy"]
      config.proxy.https   = ENV["https_proxy"]
    end
    if ENV["no_proxy"]
      puts "no_proxy: "     + ENV["no_proxy"]
      config.proxy.no_proxy = ENV["no_proxy"]
    end
  end

end

