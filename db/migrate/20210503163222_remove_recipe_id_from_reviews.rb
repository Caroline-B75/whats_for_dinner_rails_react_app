class RemoveRecipeIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :recipe_id, :integer
  end
end
