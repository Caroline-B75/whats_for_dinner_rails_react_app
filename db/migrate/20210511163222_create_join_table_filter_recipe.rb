class CreateJoinTableFilterRecipe < ActiveRecord::Migration[6.0]
  def change
    create_join_table :filters, :recipes do |t|
      # t.index [:filter_id, :recipe_id]
      # t.index [:recipe_id, :filter_id]
    end
  end
end
