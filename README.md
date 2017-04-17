# Compile a non-pae kernel

```
$ apt install virtualbox vagrant packer
$ git clone --recursive https://github.com/pfichtner/non-pae-kernel-compiler.git
$ cd non-pae-kernel-compiler/packer
$ mkdir tmp
$ TMPDIR=tmp packer build -var-file=ubuntu1704-i386.json -var 'update=true' -var 'headless=true' -var 'vm_name=ubuntu1704-kernelcompiler-i386' -var 'custom_script=../install-kernel-build-environment.sh' -var "minimize_level=0" -var "ssh_wait_timeout=2h" -only=virtualbox-iso ubuntu.json
$ cd ..
$ vagrant up
$ vagrant ssh -c "sudo apt update && sudo apt -y upgrade && sudo apt -y autoremove"
$ vagrant ssh -c "sudo sh /vagrant/compile-kernel.sh && sudo mv /usr/src/*.deb /vagrant/"
$ vagrant destroy
``` 

Why not Docker? Because it needs to compile a i386 (32 bit) kernel and should not depend on the execution environment (X86_64, MacOS, ...)


