class RemoveColumnsFromFilters < ActiveRecord::Migration[6.0]
  def change
    remove_column :filters, :entrée, :boolean
    remove_column :filters, :plat, :boolean
    remove_column :filters, :soupe, :boolean
    remove_column :filters, :viande, :boolean
    remove_column :filters, :poisson, :boolean
    remove_column :filters, :dessert, :boolean
    remove_column :filters, :printemps, :boolean
    remove_column :filters, :été, :boolean
    remove_column :filters, :automne, :boolean
    remove_column :filters, :hiver, :boolean
    remove_column :filters, :express, :boolean
    remove_column :filters, :veggie, :boolean
    remove_column :filters, :healthy, :boolean
    remove_column :filters, :detox, :boolean
  end
end
