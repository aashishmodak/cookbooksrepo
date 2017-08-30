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
	

Cookbook Recipes
importkey.rb
createfile.rb
update.rb
install.rb
MongoDBstatus.rb

Cookbook Default recipe includes below recipes.
include_recipe "MongoDB::importkey"
include_recipe "MongoDB::createfile"
include_recipe "MongoDB::update"
include_recipe "MongoDB::install"
include_recipe "MongoDB::MongoDB"



LICENSE and AUTHOR:

Author:: Rajeshwari Makond

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0


