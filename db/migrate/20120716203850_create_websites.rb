class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url
      t.integer :minute
      t.string :name
      t.text :summary
      t.integer :failed_tries
      t.integer :successful_tries
      t.integer :user_id

      t.timestamps
    end
  end
end
