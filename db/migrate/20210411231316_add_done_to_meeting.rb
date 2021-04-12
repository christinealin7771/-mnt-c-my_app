class AddDoneToMeeting < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :done, :boolean, default: false
  end
end
