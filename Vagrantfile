Vagrant.configure("2") do |config|

    File.open("users", "r") do |f|
        f.each_line do |line|
            # make a VM for each user in ./users

            config.vm.define line do |user|
                user.vm.box = "ubuntu/xenial64"

                user.vm.provider :virtualbox do |v|
                    v.customize ["modifyvm", :id, "--memory", 2048]
                    v.customize ["modifyvm", :id, "--name", user]
                end

                
            end
        end
    end
end