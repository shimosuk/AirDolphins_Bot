class Schedule < ActiveRecord::Base
  attr_accessible :action, :date, :location

  class << self
    def create(param)
      create! do |schedule|
        schedule.location = param[:location]
        schedule.action = param[:action]
        schedule.date = param[:date]
      end
    end

    def edit(id)
      base = Schedule.find(id)
      date = base[:date]
      base[:date] = Time.new(date.slice(0..4), date.slice(5..7), date.slice(8..10), date.slice(14..16), date.slice(17..19))
      base
    end
  end
end
