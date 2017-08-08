# cookbooksrepo

This repo is for rean assignments.
Added Hashicorp Vault cookbook

HashicorpVault Cookbook
=======================
Installs Hashicorp vault from package OR source code to CentOS 7      

Requirements
------------
Installs Hashicorp vault on CentOS 7      

Attributes
----------

node['HashicorpVault']['user'] = root
node['HashicorpVault']['group] = root
node['HashicorpVault']['sendfile'] = vault
default['HashicorpVault']['dir'] = "/usr/bin"
node.default['HashicorpVault']['dir'] = "/usr/bin"




Recipes
HashicorpVault::default
 
Just include `HashicorpVault` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[HashicorpVault]"
  ]
}
```

License and Authors
-------------------
Authors: Rajeshwari
Here I used Open Source.
