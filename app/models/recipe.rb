class Recipe < ApplicationRecord
  DIFFICULTY = ["très facile", "facile", "moyen", "avancé"]
  DIET = ["végétarien", "flexitarien", "carnivore"]
  PRICE = ["bon marché", "coût moyen", "assez cher"]

  has_many :preparations, dependent: :destroy
  has_many :ingredients, through: :preparations
  has_many :reviews, dependent: :destroy
  has_many :menu_recipes, dependent: :destroy
  has_many :menus, through: :menu_recipes
  has_one_attached :photo, dependent: :destroy
  has_many :favorite_recipes, dependent: :destroy
  has_many :favorited_by, through: :favorite_recipes, source: :user
  has_and_belongs_to_many :filters

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :difficulty, in: DIFFICULTY, presence: true
  validates_inclusion_of :price, in: PRICE, presence: true
  validates :time, presence: true
  validates :content, presence: true
  validates_inclusion_of :diet, in: DIET, presence: true

  before_destroy { self.photo.purge }

  def self.ransackable_attributes(auth_object = nil)
    %w[name difficulty price time content diet created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[preparations ingredients reviews menu_recipes menus favorite_recipes favorited_by filters users]
  end

  def self.ransackable_scopes(auth_object = nil)
    [:favorited_by_current_user]
  end
end
