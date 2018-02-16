Vagrant.configure("2") do |config|

    # make a VM for each user in ./users
    File.open("users", "r") do |f|
    #File.open("users.test", "r") do |f|
        f.each_line do |line|

            config.vm.define line do |user|
                # define the base box
                user.vm.box = "ubuntu/xenial64"

                # configure the vbox instance
                user.vm.provider :virtualbox do |v|
                    v.customize ["modifyvm", :id, "--memory", 2048]
                    v.customize ["modifyvm", :id, "--name", user]
                end

                # disable the shared folder
                user.vm.synced_folder ".", "/vagrant", disabled: true

                # provision the VM
                user.vm.provision "shell" do |s|
                    s.path = "provision.sh"
                    s.args = user
                end
            end
        end
    end
end