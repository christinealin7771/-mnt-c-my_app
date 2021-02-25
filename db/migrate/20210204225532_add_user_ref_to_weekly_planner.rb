class AddUserRefToWeeklyPlanner < ActiveRecord::Migration[6.1]
  def change
    add_reference :weekly_planners, :user, null: false, foreign_key: true
  end
end
