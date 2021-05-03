class AddRecipeToFavoriteRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :favorite_recipes, :recipe, null: false, foreign_key: true
  end
end
