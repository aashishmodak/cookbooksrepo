execute 'create list of files' do
   command 'echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list'
   action :run
   not_if { File.exist?('/etc/apt/sources.list.d/mongodb-org-3.0.list') }
end
