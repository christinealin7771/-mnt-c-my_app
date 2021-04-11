class DropTableCountdownTimer < ActiveRecord::Migration[6.1]
  def change
    drop_table :countdown_timers
  end
end
