MongoDB Cookbook

Installs MongoDB on Ubuntu 14.04


REQUIREMENTS:
Install MongoDB

Platform
Ubuntu 14.04

This Cookbook requires
chef-client version: 13.2.20
delivery version: master (73ebb72a6c42b3d2ff5370c476be800fee7e5427)
berks version: 6.3.0
kitchen version: 1.17.0
inspec version: 1.33.1
	
Cookbook install by default recipe

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


LICENSE and AUTHOR:

Author:: Rajeshwari Makond

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
