class Profile < ActiveRecord::Base
  attr_accessible :birthday, :etc, :mail, :name, :number, :position, :uid
end
