# Author: Arturo Diaz
# Cookbook Name:: myJavaApp
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directoryJavaApp=Chef::Config[:file_cache_path]

 remote_file "#{Chef::Config[:file_cache_path]}/myJavaApp.jar" do
     source "https://github.com/artujose/com.test.app/blob/master/target/com.test.app-1.0.0-SNAPSHOT.jar"
     mode 00644
 end

 bash 'run_jar' do
     code <<-EOF
       java -jar #{directoryJavaApp}/myJavaApp.jar > #{directoryJavaApp}/myJavaApp.log 2>&1 &
     EOF
 end
