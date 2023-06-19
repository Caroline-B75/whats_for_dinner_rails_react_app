class GroceryItem < ApplicationRecord
  belongs_to :menu_recipe, optional: true
  belongs_to :menu

  validates :quantity, presence: true
  validates :name, presence: true
  validates_inclusion_of :category, in: Ingredient::CATEGORY, presence: true
  validates_inclusion_of :unit, in: Ingredient::UNIT, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[quantity name category unit checked created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[menu menu_recipe]
  end
end
