class DropPingsTable < ActiveRecord::Migration
  def up
    drop_table :pings
  end

  def down
  end
end
