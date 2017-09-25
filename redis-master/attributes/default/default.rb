default['redis-master']['tcp-value'] = "60"
default['redis-master']['mpsa-value'] = Chef::EncryptedDataBagItem.load('Redis', 'redis', 'redis')['password']
default['redis-master']['mm-value'] = "noeviction"
default['redis-master']['app-value'] = "yes"
default['redis-master']['file-value'] = "redis-staging-ao.aof"
default['redis-master']['master-ip'] = "" 
default['redis-master']['slavepwd-value'] = Chef::EncryptedDataBagItem.load('Redis', 'redis', 'redis')['passwordslave']
