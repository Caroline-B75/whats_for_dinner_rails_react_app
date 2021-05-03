class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :diet
      t.integer :number_of_people
      t.integer :number_of_meals
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
