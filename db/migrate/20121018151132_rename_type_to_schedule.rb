class RenameTypeToSchedule < ActiveRecord::Migration
  def up
    rename_column :schedules, :type, :action
  end

  def down
    rename_column :schedules, :action, :type
  end
end
