class ChangeForeignKeyMenuRecipeGroceryItem < ActiveRecord::Migration[6.0]
  def up
    remove_foreign_key :grocery_items, :menu_recipes
    add_foreign_key :grocery_items, :menu_recipes, on_delete: :cascade
  end
  
  def down
    remove_foreign_key :grocery_items, :menu_recipes
    add_foreign_key :grocery_items, :menu_recipes
  end
end

