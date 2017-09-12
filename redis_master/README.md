# redis_master
MongoDB Cookbook

Installs MongoDB on Ubuntu 14.04


REQUIREMENTS:
Install Redis Cluster
Platform
Ubuntu 14.04

This Cookbook requires
chef-client version: 13.2.20
delivery version: master (73ebb72a6c42b3d2ff5370c476be800fee7e5427)
berks version: 6.3.0
kitchen version: 1.17.0
inspec version: 1.33.1
	

Cookbook Recipes
default.rb
master.rb  and
slave.rb

Cookbook Default recipe 
Nothing added in default recipe os cookbook.

To build Redis cluster atlease we need two servers
1.Master and 2.Slave(atleast one slave)

In this cookbook there two other recipe are
master.rb : to configure redis master
slave.rb  : to configure redis slave

master.rb contains 
execute 'add-repository' do
  command 'sudo add-apt-repository ppa:chris-lea/redis-server -y'
  not_if { File.exist?("/root/.gnupg/secring.gpg")}
end

execute 'redis_server_install' do
  command 'apt-get update && apt-get install redis-server -y'
  not_if { File.exist?("/etc/redis/redis.conf")}
end

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/redis/redis.conf")
    file.search_file_replace_line(/tcp-keepalive 300/, "tcp-keepalive 60")
    file.search_file_replace_line(/bind 127.0.0.1/, "#bind 127.0.0.1")
    file.search_file_replace_line(/requirepass/, "requirepass Th!sisredis@10")
    file.search_file_replace_line(/maxmemory-policy/, "maxmemory-policy noeviction")
    file.search_file_replace_line(/appendonly no/, "appendonly yes")
    file.search_file_replace_line(/appendfilename/, "appendfilename redis-staging-ao.aof")
    file.write_file
  end
end

service 'redis-server' do
  action :restart
end
 
slave.rb contains
execute 'add-repository' do
  command 'sudo add-apt-repository ppa:chris-lea/redis-server -y'
  not_if { File.exist?("/root/.gnupg/secring.gpg")}
end

execute 'redis_server_install' do
  command 'apt-get update && apt-get install redis-server -y'
  not_if { File.exist?("/etc/redis/redis.conf")}
end

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/redis/redis.conf")
    file.search_file_replace_line(/tcp-keepalive/, "tcp-keepalive 60")
    file.search_file_replace_line(/bind 127.0.0.1/, "#bind 127.0.0.1")
    file.search_file_replace_line(/requirepass/, "requirepass Th!sisredis-slave@10")
    file.search_file_replace_line(/slaveof/, "slaveof 172.31.31.164 6379")
    file.search_file_replace_line(/masterauth/, "masterauth Th!sisredis@10")
    file.write_file
  end
end

service 'redis-server' do
  action :restart
end



LICENSE and AUTHOR:

Author:: Rajeshwari Makond

License :: Follow the link https://redis.io/topics/license.
