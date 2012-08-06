class ChangeWebsiteFailedTriesToNonNull < ActiveRecord::Migration
  def up
    change_column :websites, :failed_tries, :integer, :null => false
    change_column :websites, :successful_tries, :integer, :null => false
  end

  def down
  end
end
