class User < ActiveRecord::Base
  attr_accessible :name, :provider, :screen_name, :uid
end
