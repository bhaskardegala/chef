#
# Cookbook:: .
# Recipe:: install_maven
#
# Copyright:: 2019, The Authors, All Rights Reserved.

remote_file "/opt/#{ node['maven']['package_maven'] }.tar.gz" do
    source node['maven']['download_link']
    action :create
end

bash 'extrcting' do
  cwd '/opt'
  code <<-EOH
    mkdir -p maven
    tar xzf #{ node['maven']['package_maven'] }.tar.gz -C maven
    EOH
  action :run
  not_if { ::File.exist?'/opt/maven' }
end
cookbook_file '/etc/profile.d/mavenenv.sh' do
    source 'mavenenv.sh'
    action :create
end

bash 'maven_start' do
    cwd '/etc/profile.d/'
    code <<-EOH
      chmod +x mavenenv.sh
      source mavenenv.sh
      EOH
    action :run 
end