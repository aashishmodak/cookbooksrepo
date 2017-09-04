#Install Mysql


#mysql_service 'foo' do
#  port '3306'
# version '5.5'
#  initial_root_password 'P@ssword220413'
#  action [:create, :start]
#end
mysqlpass = data_bag_item("mysql", "rtpass.json")

mysql_service "mysqldefault" do
  initial_root_password mysqlpass["password"]
  action [:create, :start]
end
