# Compile a non-pae kernel

```
$ apt install virtualbox vagrant packer
$ git clone --recursive https://github.com/pfichtner/non-pae-kernel-compiler.git
$ cd non-pae-kernel-compiler/packer
$ mkdir tmp
$ TMPDIR=tmp packer build -var-file=ubuntu1610-i386.json -var 'update=true' -var 'headless=true' -var 'vm_name=ubuntu1610-kernelcompiler-i386' -var 'custom_script=kernel-compiler.sh' -var "ssh_wait_timeout=15000s" -only=virtualbox-iso ubuntu.json
$ cd ..
$ vagrant box add devbox packer/box/virtualbox/ubuntu1610-kernelcompiler-i386-0.1.0.box
$ vagrant up
``` 

Why not Docker? Because it needs to compile a i386 (32 bit) kernel and should not depend on the execution environment (X86_64, MacOS, ...)


