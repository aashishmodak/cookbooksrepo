#
# Cookbook:: HashicorpVault
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
cookbook_file '/usr/bin/vault' do
source 'vault'
user 'root'
group 'root'
mode '0755'
action :create
end
