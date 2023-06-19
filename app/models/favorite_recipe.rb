class FavoriteRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user recipe]
  end
end