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
