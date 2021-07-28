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
end
