class AddNameToFilters < ActiveRecord::Migration[6.0]
  def change
    add_column :filters, :name, :string
  end
end
