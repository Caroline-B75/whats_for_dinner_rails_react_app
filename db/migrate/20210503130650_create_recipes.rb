class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :difficulty
      t.string :price
      t.string :time
      t.string :content
      t.string :diet

      t.timestamps
    end
  end
end
