# hconsul

hconsul Cookbook
=======================
Installs Hashicorp Consul from package OR source code to CentOS 7      

Requirements
------------
Installs Hashicorp Consul on CentOS 7      

Attributes
----------

node['hconsul']['user'] = root
node['hconsul']['group] = root
node['hconsul']['sendfile'] = consul
default['hconsul']['dir'] = "/usr/bin"
node.default['hconsul']['dir'] = "/usr/bin"




Recipes
hconsul::default
 
Just include `hconsul` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[hconsul]"
  ]
}
```

License and Authors
-------------------
Authors: Rajeshwari
There are three types of packages in Hashicorp Consul 
1.Open Source 2.Pro Enterprise 3.Premium Enterprise.Here I used Open Source for other two packges License: https://www.hashicorp.com/products/consul/


