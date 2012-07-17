class ChangeMinuteInWebsitesToNotBeNull < ActiveRecord::Migration
  def up
    change_column :websites, :minute, :integer, :null => false
  end

  def down
  end
end
