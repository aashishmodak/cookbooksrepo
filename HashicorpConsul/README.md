# HashicorpConsul

TODO: Enter the cookbook description here.
HashicorpConsul Cookbook

Installs and Configure Hashicorp consul from package OR source code to CentOS 7

Requirements

Installs Hashicorp consul and starts Consul ui server in dev mode on CentOS 7

Attributes

node['consul']['user'] = root node['consul']['group] = root node['consul']['sendfile'] = consul default['consul']['dir'] = "/usr/bin" node.default['consul']['dir'] = "/usr/bin" node.default['consul']['data-dir']="/consul/data"

Recipes consul::default

Just include consul in your node's run_list:

{
  "name":"my_node",
  "run_list": [
    "recipe[consul]"
  ]
}
License and Authors

Authors: Rajeshwari 
Here I used Open Source.
