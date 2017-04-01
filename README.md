# Compile a non-pae kernel

```
$ apt install virtualbox vagrant packer
$ git clone --recursive https://github.com/pfichtner/non-pae-kernel-compiler.git
$ cd non-pae-kernel-compiler/packer
$ mkdir tmp
$ TMPDIR=tmp packer build -var-file=ubuntu1610-i386.json -var 'update=true' -var 'headless=true' -var 'vm_name=ubuntu1610-kernelcompiler-i386' -var 'custom_script=../install-kernel-build-environment.sh' -var "ssh_wait_timeout=2h" -only=virtualbox-iso ubuntu.json
$ cd ..
$ vagrant up
$ vagrant ssh -c "sudo sh /vagrant/compile-kernel.sh"
$ vagrant ssh -c "sudo mv /usr/src/*.deb /vagrant/"
``` 

Why not Docker? Because it needs to compile a i386 (32 bit) kernel and should not depend on the execution environment (X86_64, MacOS, ...)


