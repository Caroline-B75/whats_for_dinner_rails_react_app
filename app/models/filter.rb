class Filter < ApplicationRecord
  has_and_belongs_to_many :recipes
  def self.ransackable_attributes(auth_object = nil)
    %w[id name created_at updated_at] # 'id' has been added
  end

  def self.ransackable_associations(auth_object = nil)
    %w[recipes]
  end
end
