#
# Cookbook:: MongoDB
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#include_recipe 'MongoDB::importpkey'
execute 'import public key cmd' do
    command "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
    action :run
end

#include_recipe 'MongoDB::createfile'
execute 'create list of files' do
   command 'echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list'
   action :run
   not_if { File.exist?('/etc/apt/sources.list.d/mongodb-org-3.0.list') }
end

#include_recipe 'MongoDB::update'
execute "update-upgrade" do
  command "apt-get update -y"
  action :run
end

#include_recipe 'MongoDB::install'
execute 'install MongoDB' do
     command "apt-get install mongodb-org -y"
     action :run
end

#include_recipe 'MongoDB::MongoDBstatus'
execute 'check status of MongoDB' do
   command "service mongod status"
   action :run
end
