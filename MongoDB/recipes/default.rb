#
# Cookbook:: MongoDB
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#include_recipe 'MongoDB::importpkey'
include_recipe 'MongoDB::createfile'
#include_recipe 'MongoDB::update'
#include_recipe 'MongoDB::install'
#include_recipe 'MongoDB::MongoDBstatus'
