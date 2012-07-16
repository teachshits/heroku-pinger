class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.integer :status
      t.integer :response_length
      t.integer :website_id

      t.timestamps
    end
  end
end
