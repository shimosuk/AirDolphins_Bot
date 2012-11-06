class Profile < ActiveRecord::Base
  attr_accessible :birthday, :etc, :mail, :name, :number, :position, :uid
  validates :name, presence: true
  validates :position, presence: true
  def self.create(user_id, name, uid)
    create! do |profile|
      profile.name = name
      profile.uid = uid
      profile.user_id = user_id
    end
  end
end
