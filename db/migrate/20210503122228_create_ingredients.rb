class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :unit
      t.string :category

      t.timestamps
    end
  end
end
