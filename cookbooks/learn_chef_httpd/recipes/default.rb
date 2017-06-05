#
# Cookbook Name:: learn_chef_httpd
# Recipe:: default
#
# Copyright (C) 2014
#
#
#
package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

group 'himmat'

user 'himmat' do
  group 'himmat'
  system true
  shell '/bin/bash'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0644'
  owner 'himmat'
  group 'himmat'

end

service 'iptables' do
  action :stop
end
