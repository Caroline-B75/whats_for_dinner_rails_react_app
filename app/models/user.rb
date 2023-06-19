class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :menus, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorite_recipes, dependent: :destroy
  has_many :favorites, through: :favorite_recipes, source: :recipe, dependent: :destroy
  
  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[email username first_name last_name created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[menus reviews favorite_recipes favorites]
  end
end
