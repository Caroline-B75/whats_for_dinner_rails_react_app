class Review < ApplicationRecord
  RATING = [1, 2, 3, 4, 5]
  belongs_to :recipe
  belongs_to :user

  validates :rating, presence: true
  validates :content, presence: true
  validates_inclusion_of :rating, in: RATING

  def self.ransackable_attributes(auth_object = nil)
    %w[rating content created_at updated_at recipe_id user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[recipe user]
  end
end
