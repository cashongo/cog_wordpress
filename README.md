cog_wordpress Cookbook
======================

This cookbook creates a Wordpress instance.

Requirements
------------
It depends on cog_wpcli cookbook which requires php to be installed.

Usage
-----

Include cog_wordpress to your cookbook dependencies.

Use provider cog_wordpress_instance like this:

```ruby
cog_wordpress_instance 'instance_name' do
  action :manage
  user 'wpaccount'
  directory "/var/www/wordpress"
  dbuser "dbuser"
  dbname "dbname"
  dbhost "dbhost"
  dbpass "dbpass"
  sitetitle "Site title"
  siteurl "http://siteurl.example.com"
  adminuser "adminuser"
  adminpass "adminpass"
  adminemail 'adminemail@example.com'
  theme "theme"
  plugins ['akismet','your_plugin']
end
```

Actions
--------
* **:manage** - install and manage site, default. No other action is defined. It downloads and installs latest wordpress with named plugins and theme.

Variables
---------
* **user** - owner of wordpress files
* **directory** - directory where to install wordpress
* **dbuser** - Wordpress MySQL database user
* **dbname** - Wordpress MySQL database name
* **dbhost** - Wordpress MySQL database server host
* **dbpass** - Wordpress MySQL database password
* **sitetitle** - Wordpress site title
* **siteurl** - Wordpress site url (sets both siteurl and home)
* **adminuser** - Wordpress internal admin user name
* **adminemail** - Wordpress internal admin email address
* **adminpass** - Wordpress internal admin password
* **theme** - Wordpress theme to be installed and set as default
* **plugins** - Arrat of Wordpress plugins to be installed

It won't **update** your wordpress instance and installed plugins.


License and Authors
-------------------
Authors: Lauri Jesmin (lauri.jesmin@cashongo.co.uk)
