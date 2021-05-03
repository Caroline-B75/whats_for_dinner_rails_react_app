class AddUserToFavoriteRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :favorite_recipes, :user, null: false, foreign_key: true
  end
end
