class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :location_id 
      t.timestamps
    end
  end
end
