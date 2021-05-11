class AddForeignKeyRecipeToFiltersRecipes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :filters_recipes, :recipes
    add_foreign_key :filters_recipes, :filters
  end
end
