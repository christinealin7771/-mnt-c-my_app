class CreateWeeklyPlanners < ActiveRecord::Migration[6.1]
  def change
    create_table :weekly_planners do |t|
      t.string :event

      t.timestamps
    end
  end
end
