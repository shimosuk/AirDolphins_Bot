class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :date
      t.text :location
      t.string :action

      t.timestamps
    end
  end
end
