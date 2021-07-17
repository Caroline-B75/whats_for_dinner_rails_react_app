class AddVersionToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :version, :integer
  end
end
