# Author: Arturo Diaz
# Cookbook Name:: myJavaApp
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe "java"

directory '/var/log/myJavaApp' do
 owner 'root'
 group 'root'
 mode '0755'
 recursive true
 action: create
end

template "/etc/init.d/myJavaApp_service" do
 source "myJavaApp_script.erb"
 mode 00700
 variables( 
  server_port: node[:deploy]['myJavaApp'][:environment_variables][:server_port],
  app_host: node[:deploy]['myJavaApp'][:environment_variables][:app_host] )
end

service "myJavaApp_service" do
 start_cmd "/usr/lib/myJavaApp/bin/myJavaApp start"
 action [ :enable, :start]
end
