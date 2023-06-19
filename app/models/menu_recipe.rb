class MenuRecipe < ApplicationRecord
  belongs_to :menu
  belongs_to :recipe
  has_many :grocery_items

  validates :number_of_people, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[number_of_people done favorite created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[menu recipe grocery_items]
  end
end
