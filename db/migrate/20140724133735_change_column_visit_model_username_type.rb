class ChangeColumnVisitModelUsernameType < ActiveRecord::Migration
  def change
    remove_column :visits, :user_name
    add_column :visits, :user_id, :integer
  end
end
