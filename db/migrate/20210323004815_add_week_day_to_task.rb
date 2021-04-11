class AddWeekDayToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :week_day, :date
  end
end
