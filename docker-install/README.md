# docker-install

docker-install Cookbook
=======================
Installs Hashicorp vault from package OR source code to CentOS 7      

Requirements
------------
Installs Hashicorp vault on CentOS 7      

Attributes
----------

node['docker-install']['user'] = user
node['docker-install']['group] = user

Recipes
docker-install::default
 
Just include `docker-install` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[docker-install]"
  ]
}
```

License and Authors
-------------------
Authors: Rajeshwari
Here I used Open Source.For license https://www.docker.com/pricing
