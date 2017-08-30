execute 'install MongoDB' do
     command "apt-get install mongodb-org -y"
     action :run
end 
