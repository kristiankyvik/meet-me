class RenameCplumn < ActiveRecord::Migration
  def change
    rename_column :locations, :id, :location_id
  end
end
