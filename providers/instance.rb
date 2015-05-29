#
# Cookbook Name:: cog_nginx
# Provider:: site
#
# Author:: Lauri Jesmin <lauri.jesmin@cashongo.co.uk>
# Copyright 2015, Cash on Go
#
# In Chef 11 and above, calling the use_inline_resources method will
# make Chef create a new "run_context". When an action is called, any
# nested resources are compiled and converged in isolation from the
# recipe that calls it.

# Allow for Chef 10 support
use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :manage  do

  directory new_resource.directory do
    action :create
    owner new_resource.user
    mode '0755'
  end

  if (new_resource.locale.nil?) then
    download_wp = 'wp core download'
  else
    download_wp = "wp core download --locale=#{new_resource.locale}"
  end

  execute 'download wordpress' do
    command download_wp
    cwd new_resource.directory
    user new_resource.user
    action :run
    not_if { ::File.exist?("#{new_resource.directory}/wp-load.php") }
  end

  dbprefix=""
  dbprefix="#{new_resource.dbprefix}" if (!new_resource.dbprefix.nil?)

  execute 'set up wordpress' do
    command "wp core config --dbname=#{new_resource.dbname} --dbuser=#{new_resource.dbuser} --dbpass=#{new_resource.dbpass} --dbhost=#{new_resource.dbhost} #{dbprefix}"
    cwd new_resource.directory
    user new_resource.user
    action :run
    not_if { ::File.exists?("#{new_resource.directory}/wp-config.php")}
  end

  execute 'wp core install' do
    command "wp core install --url=#{new_resource.siteurl} --title=#{new_resource.sitetitle} --admin_user=#{new_resource.adminuser} --admin_password=#{new_resource.adminpass} --admin_email=#{new_resource.adminemail}"
    cwd new_resource.directory
    user new_resource.user
    action :run
    sensitive true
  end

  execute 'wp user update' do
    command "wp user update #{new_resource.adminuser} --user_pass=#{new_resource.adminpass}"
    cwd new_resource.directory
    user new_resource.user
    action :run
    sensitive true
  end

  execute 'install WP theme' do
    command "wp theme install #{new_resource.theme} --activate --force"
    cwd new_resource.directory
    user new_resource.user
    action :run
  end

  new_resource.plugins.each do |wpplugin|
    execute 'install wp plugin' do
      command "wp plugin install #{wpplugin}"
      cwd new_resource.directory
      user new_resource.user
      action :run
    end
  end
end
