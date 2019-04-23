#
# Cookbook:: maven
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'maven::install_java'
include_recipe 'maven::install_maven'
include_recipe 'maven::download_shopizer'