class Preparation < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :quantity, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    %w[quantity ingredient_id recipe_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[ingredient recipe]
  end
end
