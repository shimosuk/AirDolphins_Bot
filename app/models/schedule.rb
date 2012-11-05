class Schedule < ActiveRecord::Base
  attr_accessible :action, :date, :location
  def self.create(param)
    create! do |schedule|
      schedule.location = param[:location]
      schedule.action = param[:action]
      schedule.date = param[:date]
    end
  end
end
