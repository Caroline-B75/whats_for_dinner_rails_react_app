class CreateFilters < ActiveRecord::Migration[6.0]
  def change
    create_table :filters do |t|
      t.boolean :entrée, default: false
      t.boolean :plat, default: false
      t.boolean :soupe, default: false
      t.boolean :viande, default: false
      t.boolean :poisson, default: false
      t.boolean :dessert, default: false
      t.boolean :printemps, default: false
      t.boolean :été, default: false
      t.boolean :automne, default: false
      t.boolean :hiver, default: false
      t.boolean :express, default: false
      t.boolean :veggie, default: false
      t.boolean :healthy, default: false
      t.boolean :detox, default: false

      t.timestamps
    end
  end
end
