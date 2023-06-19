class Ingredient < ApplicationRecord
  CATEGORY = ["Bio", "Boissons", "Boucherie et charcuterie", "Boulangerie", "Épicerie salée", "Épicerie sucrée", "Fromagerie", "Fruits et légumes", "Hygiène et beauté", "Poissonnerie", "Produits frais libre-service", "Surgelé", "Traiteur", "Vins, Champagnes, alcools", "Autre"]
  UNIT = ["l","dl", "cl", "ml", "kg", "g", "mg", "cm", "botte(s)", "branche(s)", "cube(s)", "cuillère(s) à café", "cuillère(s) à soupe", "entier(s)", "feuille(s)", "gousse(s)", "goutte(s)", "paquet(s)", "pièce(s)", "pincée(s)", "poignée(s)", "rouleau(x)", "tranche(s)", "unité(s)"]
  has_many :preparations, dependent: :destroy
  has_many :recipes, through: :preparations

  validates :name, presence: true
  validates :unit, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, in: CATEGORY, presence: true
  validates_inclusion_of :unit, in: UNIT, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name unit category created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[preparations recipes]
  end

end
