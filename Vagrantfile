# -*- mode: ruby -*-
# vi: set ft=ruby :
# require 'securerandom'
Vagrant.configure('2') do |config|
	vm_box = 'bento/ubuntu-20.04'
	# $default_network_interface = `ip route | awk '/^default/ {printf "%s", $5; exit 0}'`
	config.vm.define :manager, primary: true  do |manager|
		manager.vm.box = vm_box
		manager.vm.boot_timeout=10000000
		manager.vm.box_check_update = true
		manager.vm.provider :virtualbox
		manager.vm.network :private_network, type: "dhcp"
		manager.vm.network :public_network, bridge: "eth0", use_dhcp_assigned_default_route: true
		# manager.vm.network :forwarded_port, guest: 8080, host: 8080
		# manager.vm.network :forwarded_port, guest: 5000, host: 5000
		manager.vm.network :forwarded_port, guest: 80, host: 80
		manager.vm.network :forwarded_port, guest: 443, host: 443
		manager.vm.network :forwarded_port, guest: 4789, host: 4789
		manager.vm.network :forwarded_port, guest: 7946, host: 7946
		manager.vm.network :forwarded_port, guest: 2377, host:2377
		manager.vm.hostname = "manager"
		manager.vm.synced_folder ".", "/vagrant"
		# manager.vm.provision "installStuffProv", type: "shell", privileged: true do |s|
		# 	s.path= "installStuff.sh"
		# end		
		manager.vm.provision "managerProv", type: "shell", privileged: true do |s|
			s.path= "managerScript.sh"
		end
		manager.vm.provider "virtualbox" do |vb|
			vb.name = "manager01"
			vb.memory = "1024"
			# vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
		end
	end
	(3..4).each do |i|
		config.vm.define "worker0#{i}" do |worker|
			worker.vm.box = vm_box
			worker.vm.box_check_update = true
			worker.vm.boot_timeout=10000000
			worker.vm.provider :virtualbox
			worker.vm.network :private_network #, ip: "192.168.199.20#{i}"
			worker.vm.network :public_network #, bridge: "$default_network_interface",  use_dhcp_assigned_default_route: true
			worker.vm.hostname = "worker0#{i}"
			worker.vm.synced_folder ".", "/vagrant"
			worker.vm.provision "installStuffProv", type: "shell", privileged: true do |s|
				s.path= "installStuff.sh"
			end
			worker.vm.provision "workerProv", type: "shell", privileged: true do |s|
				s.path= "workerScript.sh"
			end
			worker.vm.provider "virtualbox" do |vb|
				vb.name = "worker0#{i}"
				vb.memory = "1024"
				# vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
			end
		end
	end
end