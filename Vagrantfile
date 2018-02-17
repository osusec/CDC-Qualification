ip_last = 80

Vagrant.configure("2") do |config|

    # make a VM for each user in ./users
    #File.open("users", "r") do |f|
    File.open("users.test", "r") do |f|
        f.each_line do |line|
            # remove newline from line
            line = line.delete("\n")
            ip = "192.168.42.#{ip_last}"
            ip_last += 1

            config.vm.define line do |user|
                # define the base box
                user.vm.box = "ubuntu/xenial64"
                user.vm.hostname = "#{line}-cdc-qual"
                user.vm.box_url = "ubuntu/xenial64"

                # configure the vbox instance
                user.vm.provider :virtualbox do |v|
                    v.customize ["modifyvm", :id, "--memory", 2048]
                    v.customize ["modifyvm", :id, "--name", "#{line}"]
                end

                # configure networking
                user.vm.network "public_network", use_dhcp_assigned_default_route: true

                # configure ssh
                user.ssh.host = ip

                # disable the shared folder
                user.vm.synced_folder ".", "/vagrant", disabled: true

                # provision the VM
                user.vm.provision "shell" do |s|
                    s.path = "provision.sh"
                    s.args = "#{line}"
                end
            end
        end
    end
end
