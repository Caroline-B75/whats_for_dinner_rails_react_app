class Menu < ApplicationRecord
  has_many :menu_recipes, dependent: :destroy
  has_many :recipes, through: :menu_recipes
  has_many :grocery_items, dependent: :destroy
  has_many :accesses, dependent: :destroy
  belongs_to :user

  validates :diet, presence: true
  validates :number_of_people, presence: true
  validates :number_of_meals, presence: true
  validates_inclusion_of :diet, in: Recipe::DIET


  def self.ransackable_attributes(auth_object = nil)
    %w[diet number_of_people number_of_meals user_id created_at updated_at version]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user menu_recipes recipes grocery_items accesses]
  end
  
  def users
    users = []
    users << self.user

    access_users = accesses.map { |access| access.user }

    users << access_users
    users.flatten
  end
end
