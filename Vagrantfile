Vagrant.configure("2") do |config|
  config.vm.box = "comiq/dockerbox"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.define "chatroom-vm", guest: 9000, host: 9000

  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'playbook.yml'
  end
end
