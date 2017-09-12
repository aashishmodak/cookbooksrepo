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
