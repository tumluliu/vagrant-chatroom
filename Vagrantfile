VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "comiq/dockerbox"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 19001, host: 19001
  config.vm.define "chatroom-vm"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'provisioning/site.yml'
  end
end
