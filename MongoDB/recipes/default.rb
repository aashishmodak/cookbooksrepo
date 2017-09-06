#
# Cookbook:: MongoDB
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'addkey' do
  uri 'http://repo.mongodb.org/apt/ubuntu'
  components ['multiverse']
  distribution 'trusty/mongodb-org/3.0'
  key '7F0CEB10'
  keyserver 'keyserver.ubuntu.com'
  action :add
end

package "mongodb-org" do
  action :install
end

service 'mongod' do
   action [:enable, :start]
end
