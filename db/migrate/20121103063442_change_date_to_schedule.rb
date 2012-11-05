class ChangeDateToSchedule < ActiveRecord::Migration
  def up
    change_column :schedules, :date, :string
  end

  def down
    change_column :schedules, :date, :datetime
  end
end
