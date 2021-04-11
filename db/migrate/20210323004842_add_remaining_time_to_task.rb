class AddRemainingTimeToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :remaining_time, :datetime
  end
end
