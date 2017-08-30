execute 'import public key cmd' do
    command "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
    action :run
end
