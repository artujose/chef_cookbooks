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
end

template "/etc/init.d/myJavaApp_service" do
 source "myJavaApp_script.erb"
 mode 00700
end

service "myJavaApp_service" do
 start_cmd "/usr/lib/myJavaApp/bin/myJavaApp start"
 action [ :enable, :start]
end
