class AddColumnRecipeIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :recipe_id, :bigint
  end
end
