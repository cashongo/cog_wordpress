actions :manage

default_action :manage

attribute :directory, :kind_of => String, :regex =>  /.*/, :default => nil
attribute :user,      :kind_of => String, :regex =>  /.*/, :default => nil
attribute :locale,    :kind_of => String, :regex =>  /.*/, :default => nil
attribute :dbuser,    :kind_of => String, :regex =>  /.*/, :default => nil
attribute :dbpass,    :kind_of => String, :regex =>  /.*/, :default => nil
attribute :dbname,    :kind_of => String, :regex =>  /.*/, :default => nil
attribute :dbprefix,  :kind_of => String, :regex =>  /.*/, :default => nil
attribute :dbhost,    :kind_of => String, :regex =>  /.*/, :default => "localhost"
attribute :adminuser, :kind_of => String, :regex =>  /.*/, :default => "admin"
attribute :adminpass, :kind_of => String, :regex =>  /.*/, :default => nil
attribute :adminemail,:kind_of => String, :regex =>  /.*/, :default => nil
attribute :siteurl,   :kind_of => String, :regex =>  /.*/, :default => nil
attribute :sitetitle, :kind_of => String, :regex =>  /.*/, :default => nil
attribute :theme,     :kind_of => String, :regex =>  /.*/, :default => nil
attribute :plugins,   :kind_of => Array, :regex =>  /.*/, :default => []
