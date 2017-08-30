execute "update-upgrade" do
  command "apt-get update -y"
  action :run
end
