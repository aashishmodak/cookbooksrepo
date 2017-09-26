redis-cluster Cookbook

Installs Redis Cluster on Ubuntu 14.04

REQUIREMENTS: Install Redis Cluster

Platform Ubuntu 14.04

This Cookbook requires chef-client version: 13.2.20 delivery version: master (73ebb72a6c42b3d2ff5370c476be800fee7e5427) berks version: 6.3.0 kitchen version: 1.17.0 inspec version: 1.33.1
To Install Redis Cluster need two Ubuntu instances one for master configuration and other for slave configuration. So cookbook have two recipes one for master that is master.rb recipe and other slave.rb. 

*master.rb
password = Chef::EncryptedDataBagItem.load('Redis', 'redis', 'redis')['password']
puts password

apt_repository 'redis-server' do
  uri 'ppa:chris-lea/redis-server'
end

package 'redis-server' do
action :install
end

template '/etc/redis/redis.conf' do
  source 'redis_master.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[redis-server]', :delayed
end

service "redis-server" do
  supports :status => true, :restart => true, :start => true
  action [ :start ]
end

*slave.rb
passwordslave = Chef::EncryptedDataBagItem.load('Redis', 'redis', 'redis')['passwordslave']
puts passwordslave

password = Chef::EncryptedDataBagItem.load('Redis', 'redis', 'redis')['password']
puts password

apt_repository 'redis-server' do
  uri 'ppa:chris-lea/redis-server'
end

package 'redis-server' do
action :install
end

template '/etc/redis/redis.conf' do
  source 'redis_slave.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[redis-server]', :delayed
end

service "redis-server" do
  supports :status => true, :restart => true, :start => true
  action [ :start ]
end

The vaules of configuration file comes from attributes default file.
The Password kept in data-bag
The ip update from role   and both data bag and role uploaded to chef-server.

attributes/default.rb 
default['redis-master']['tcp-value'] = "60"
default['redis-master']['mpsa-value'] = Chef::EncryptedDataBagItem.load('Redis', 'redis', 'redis')['password']
default['redis-master']['mm-value'] = "noeviction"
default['redis-master']['app-value'] = "yes"
default['redis-master']['file-value'] = "redis-staging-ao.aof"
default['redis-master']['master-ip'] = ""
default['redis-master']['slavepwd-value'] = Chef::EncryptedDataBagItem.load('Redis', 'redis', 'redis')['passwordslave']


template
redis-master.erb    and
redis-slave.erb are redis cluster config file having with required attributes.

LICENSE and AUTHOR:

Author:: Rajeshwari Makond

License: https://redis.io/topics/license
