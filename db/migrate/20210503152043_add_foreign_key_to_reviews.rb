class AddForeignKeyToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :recipes
    add_foreign_key :reviews, :users
  end
end
