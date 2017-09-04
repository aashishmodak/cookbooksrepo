#
# Cookbook:: MongoDB
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#'MongoDB::importpkey'
apt_repository 'import_key' do
  uri 'hkp://keyserver.ubuntu.com:80'
  components ['main']
  distribution 'trusty'
  key '7F0CEB10'
  keyserver 'keyserver.ubuntu.com'
  action :add
  deb_src true
end

#'MongoDB::createfile'
apt_repository 'create_file' do
uri 'hkp://keyserver.ubuntu.com:80'
  components ['main']
  distribution 'trusty'
cookbook 'sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list'
end

#'MongoDB::update'
apt_update 'update' do
end

#'MongoDB::installs, enable and start'
package "mongodb" do
  action :install
end

service 'mongodb' do
   action [:enable, :start]
end
