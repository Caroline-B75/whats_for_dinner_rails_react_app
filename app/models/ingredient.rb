class Ingredient < ApplicationRecord
  CATEGORY = ["Boulangerie", "Fromagerie", "Poissonnerie", "Traiteur", "Fruits et légumes", "Boucherie et charcuterie", "Produits frais libre-service", "Boissons", "Vins, Champagnes, alcools", "Epicerie Sucrée", "Epicerie salée", "Textile", "Bazar", "Droguerie", "Bio", "Autre", "Surgelé", "Hygiène et beautée", "Animalerie"].sort
  UNIT = ["l","dl", "cl", "ml", "kg", "g", "mg", "botte(s)", "branche(s)", "cube(s)", "cuillère(s) à café", "cuillère(s) à soupe", "entier", "feuille(s)", "gousse(s)", "goutte(s)", "paquet(s)", "pincée(s)", "rouleau(x)", "tranche(s)", "unité(s)"]
  # has_many :preparations
  # has_many :recipes, through: :preparations

  validates :name, presence: true
  validates :unit, presence: true
  validates_inclusion_of :category, in: CATEGORY, presence: true
  validates_inclusion_of :unit, in: UNIT, presence: true
end
