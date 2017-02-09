#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'httpd' do
    action :install
end

#remote_file '/var/www/html/peacock.png' do
#    source 'http://www.chrisjanson.com/sites/g/files/g2000005281/f/sample_01.jpg'
#end

#cookbook_file '/var/www/html/index.html' do
#    source 'index.html'
#end

template 'var/www/html/index.html' do
    source 'index.html.erb'
#:before, :delayed, :immediately
#
#notifies :action, 'resource[name]', :timer
#subscribes :aciton, 'resource[name]', :timer
#    notifies :restart, 'service[httpd]', :immediately
end

#bash "Some Script" do
#    user "root"
#    code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites/"
   # not_if '[-d /var/www/mysites/]'
#    not_if do
#	File.directory?('/var/www/mysites/')
#    end
   #only_if
#end

#execute "run a script" do
#    user "root"
#    command <<-EOH
#        mkdir -p /var/www/mysites/ /
#	chown -R apache /var/www/mysites/
#    EOH
#end

#directory "/var/www/mysites" do
#    owner 'apache'
#    recursive true
#end

service 'httpd' do
    action [:enable, :start]
    subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
