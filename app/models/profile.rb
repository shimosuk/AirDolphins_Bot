class Profile < ActiveRecord::Base
  attr_accessible :birthday, :etc, :mail, :name, :number, :position, :uid
  def self.create(name, uid)
    create! do |profile|
      profile.name = name
      profile.uid = uid
    end
  end
end
