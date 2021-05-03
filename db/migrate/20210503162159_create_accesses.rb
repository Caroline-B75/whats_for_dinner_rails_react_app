class CreateAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :accesses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
    end
  end
end
