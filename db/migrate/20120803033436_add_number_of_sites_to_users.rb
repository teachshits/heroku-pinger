class AddNumberOfSitesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number_of_sites, :integer
  end
end
