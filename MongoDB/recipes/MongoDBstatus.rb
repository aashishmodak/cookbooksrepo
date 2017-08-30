execute 'check status of MongoDB' do 
   command "service mongod status"
   action :run
end
