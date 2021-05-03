class ChangeQuantityToBeFloatInPreparations < ActiveRecord::Migration[6.0]
  def change
    change_column :preparations, :quantity, :float
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
