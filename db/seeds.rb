# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Access.destroy_all
Review.destroy_all
Preparation.destroy_all
Ingredient.destroy_all
GroceryItem.destroy_all
MenuRecipe.destroy_all
Recipe.destroy_all
Menu.destroy_all
User.destroy_all


# FILTRES

filtre1 = Filter.create!(name: "entrée")

# # RECETTES

# recipe1 = Recipe.create!(name: "Bricks au thon", difficulty: "très facile", price: "bon marché", time: "25 minutes", diet: "carnivore", content: "1) Faire cuire les œufs dans l'eau bouillante pour qu'ils deviennent durs (9 minutes).
# <br />2) Écailler les œufs, les écraser avec une fourchette et les mélanger avec le persil et les oignons.
# <br />3) Ajouter le thon émietté et le jus du citron pressé.
# <br />4) Poivrer à votre convenance en n'hésitant pas à goûter la farce.
# <br />5) Mettre un peu de farce au centre de chaque feuille de brick puis replier les quatre côtés de la feuille sur le dessus pour former un rectangle.")

# file1 = URI.open("https://res.cloudinary.com/dlvetmyxn/image/upload/v1620392977/brick-au-thon.jpg")
# recipe1.photo.attach(io: file1, filename: 'some-image.jpg', content_type: 'image/jpg')
# recipe1.save!

# recipe2 = Recipe.create!(name: "Lasagnes à la bolognaise", difficulty: "moyen", price: "coût moyen", time: "2 heures 5 minutes", diet: "carnivore", content: "1) Faire revenir gousses hachées d'ail et les oignons émincés dans un peu d'huile d'olive.
# <br />2) Ajouter la carotte et la branche de céleri hachée puis la viande et faire revenir le tout.
# <br />3) Au bout de quelques minutes, ajouter le vin rouge. Laisser cuire jusqu'à évaporation.
# <br />4) Ajouter la purée de tomates, l'eau et les herbes. Saler, poivrer, puis laisser mijoter à feu doux 45 minutes.
# <br />5) Préparer la béchamel : faire fondre le beurre.
# <br />6) Hors du feu, ajouter la farine d'un coup.
# <br />7) Remettre sur le feu et remuer avec un fouet jusqu'à l'obtention d'un mélange bien lisse.
# <br />8) Ajouter le lait peu à peu.
# <br />9) Remuer sans cesse, jusqu'à ce que le mélange s'épaississe.
# <br />10) Ensuite, parfumer avec la muscade, saler, poivrer. Laisser cuire environ 5 minutes, à feu très doux, en remuant. Réserver.
# <br />11) Préchauffer le four à 200°C (thermostat 6-7). Huiler le plat à lasagnes. Poser une fine couche de béchamel puis des feuilles de lasagnes, de la bolognaise, de la béchamel et du parmesan. Répéter l'opération 3 fois de suite.
# <br />12) Sur la dernière couche de lasagnes, ne mettre que de la béchamel et recouvrir de fromage râpé. Parsemer quelques noisettes de beurre.
# <br />13) Enfourner pour environ 25 minutes de cuisson.")

# file2 = URI.open("https://res.cloudinary.com/dlvetmyxn/image/upload/v1620393174/lasagnes_bolognaise.jpg")
# recipe2.photo.attach(io: file2, filename: 'some-image.jpg', content_type: 'image/jpg')
# recipe2.save!

# recipe3 = Recipe.create!(name: "Risotto aux asperges fraîches", difficulty: "très facile", price: "coût moyen", time: "60 minutes", diet: "végétarien", content: "1) Préparer les asperges en cassant le bas de l'asperge d'un coup sec (c'est la partie plus dure), les peler si nécéssaire.
# <br />2) Couper en tronçons en réservant les pointes.
# <br />3) Faire fondre le beurre et y mettre à suer les échalotes ou l'oignon finement coupés.
# <br />4) Ajouter les asperges (sans les pointes) et faites cuire doucement pendant 5 minutes.
# <br />5) Ajouter le riz et remonter le feu.
# <br />6) Ajouter le vin blanc puis le bouillon de légumes chaud (c'est important) en 3 fois que l'on ajoute à chaque fois qu'il est absorbé.
# <br />7) Le riz ne doit pas être croquant mais crémeux, ne pas trop saler, bouillon vin et fromage le feront.
# <br />8) A mi-cuisson on ajoute les pointes d'asperges. Goûter pour vérifier la cuisson du riz et poivrer, puis verser le parmesan rapé fin et noix de beurre et bien mélanger pour qu'il fondent.
# <br />9) Servir très chaud.")

# file3 = URI.open("https://res.cloudinary.com/dlvetmyxn/image/upload/v1620393176/risotto_asperges_fraiches.jpg")
# recipe3.photo.attach(io: file3, filename: 'some-image.jpg', content_type: 'image/jpg')
# recipe3.save!

# # INGREDIENTS
# ail = Ingredient.create!(name: "ail", unit: "gousse(s)", category: "Fruits et légumes")
# asperge = Ingredient.create!(name:"asperges", unit:"botte(s)", category:"Fruits et légumes")
# basilic = Ingredient.create!(name: "basilic", unit: "feuille(s)", category: "Fruits et légumes")
# beurre_doux = Ingredient.create!(name: "beurre doux", unit: "g", category: "Produits frais libre-service")
# beurre_salé = Ingredient.create!(name: "beurre salé", unit: "g", category: "Produits frais libre-service")
# boeuf_haché = Ingredient.create!(name: "boeuf haché", unit: "g", category: "Boucherie et charcuterie")
# bouillon_legume = Ingredient.create!(name:"bouillon de légumes", unit:"ml", category:"Épicerie salée")
# carotte = Ingredient.create!(name: "carotte", unit: "unité(s)", category: "Fruits et légumes")
# céleri = Ingredient.create!(name: "céléri", unit: "branche(s)", category: "Fruits et légumes")
# citron = Ingredient.create!(name: "citron", unit: "unité(s)", category: "Fruits et légumes")
# eau = Ingredient.create!(name: "eau", unit: "cl", category: "Boissons")
# farine = Ingredient.create!(name: "farine", unit: "g", category: "Épicerie sucrée")
# feuilles_de_brick = Ingredient.create!(name: "brick", unit: "feuille(s)", category: "Produits frais libre-service")
# gruyère_rapé = Ingredient.create!(name: "gruyère râpé", unit: "g", category: "Produits frais libre-service")
# huile_d_olive = Ingredient.create!(name: "huile d'olive", unit: "cuillère(s) à soupe", category: "Épicerie salée")
# lait = Ingredient.create!(name: "lait", unit: "ml", category: "Produits frais libre-service")
# laurier = Ingredient.create!(name: "laurier", unit: "feuille(s)", category: "Épicerie salée")
# muscade_rapée = Ingredient.create!(name: "muscade rapée", unit: "pincée(s)", category: "Épicerie salée")
# oeuf = Ingredient.create!(name: "oeuf(s)", unit: "unité(s)", category: "Produits frais libre-service")
# oignon = Ingredient.create!(name: "oignon", unit: "g", category: "Fruits et légumes")
# parmesan = Ingredient.create!(name: "parmesan", unit: "g", category: "Produits frais libre-service")
# pate_de_lasagne = Ingredient.create!(name: "pâtes de lasagne", unit: "paquet(s)", category: "Épicerie salée")
# persil = Ingredient.create!(name: "persil", unit: "g", category: "Fruits et légumes")
# poivre = Ingredient.create!(name: "poivre", unit: "pincée(s)", category: "Épicerie salée")
# purée_de_tomate = Ingredient.create!(name: "purée de tomate", unit: "g", category: "Épicerie salée")
# riz = Ingredient.create!(name:"riz", unit:"g", category:"Épicerie salée")
# sel = Ingredient.create!(name: "sel", unit: "pincée(s)", category: "Épicerie salée")
# thon = Ingredient.create!(name: "thon", unit: "g", category: "Poissonnerie")
# thym = Ingredient.create!(name: "thym", unit: "branche(s)", category: "Épicerie salée")
# vin_blanc = Ingredient.create!(name:"vin blanc", unit:"cl", category:"Vins, Champagnes, alcools")
# vin_rouge = Ingredient.create!(name: "vin rouge", unit: "cl", category: "Vins, Champagnes, alcools")


# # PREPARATIONS
# Preparation.create!(ingredient_id: feuilles_de_brick.id, recipe_id: recipe1.id, quantity: 2.5)
# Preparation.create!(ingredient_id: thon.id, recipe_id: recipe1.id, quantity: 70)
# Preparation.create!(ingredient_id: oignon.id, recipe_id: recipe1.id, quantity: 20)
# Preparation.create!(ingredient_id: oeuf.id, recipe_id: recipe1.id, quantity: 1)
# Preparation.create!(ingredient_id: persil.id, recipe_id: recipe1.id, quantity: 7.5)
# Preparation.create!(ingredient_id: citron.id, recipe_id: recipe1.id, quantity: 0.25)
# Preparation.create!(ingredient_id: huile_d_olive.id, recipe_id: recipe1.id, quantity: 1)
# Preparation.create!(ingredient_id: poivre.id, recipe_id: recipe1.id, quantity: 1)

# Preparation.create!(ingredient_id: pate_de_lasagne.id, recipe_id: recipe2.id, quantity: 0.25)
# Preparation.create!(ingredient_id: oignon.id, recipe_id: recipe2.id, quantity: 35)
# Preparation.create!(ingredient_id: ail.id, recipe_id: recipe2.id, quantity: 0.25)
# Preparation.create!(ingredient_id: céleri.id, recipe_id: recipe2.id, quantity: 0.25)
# Preparation.create!(ingredient_id: carotte.id, recipe_id: recipe2.id, quantity: 0.25)
# Preparation.create!(ingredient_id: boeuf_haché.id, recipe_id: recipe2.id, quantity: 75)
# Preparation.create!(ingredient_id: purée_de_tomate.id, recipe_id: recipe2.id, quantity: 100)
# Preparation.create!(ingredient_id: eau.id, recipe_id: recipe2.id, quantity: 2)
# Preparation.create!(ingredient_id: vin_rouge.id, recipe_id: recipe2.id, quantity: 2.5)
# Preparation.create!(ingredient_id: laurier.id, recipe_id: recipe2.id, quantity: 0.25)
# Preparation.create!(ingredient_id: thym.id, recipe_id: recipe2.id, quantity: 0.5)
# Preparation.create!(ingredient_id: basilic.id, recipe_id: recipe2.id, quantity: 2)
# Preparation.create!(ingredient_id: muscade_rapée.id, recipe_id: recipe2.id, quantity: 0.25)
# Preparation.create!(ingredient_id: gruyère_rapé.id, recipe_id: recipe2.id, quantity: 9)
# Preparation.create!(ingredient_id: parmesan.id, recipe_id: recipe2.id, quantity: 15.5)
# Preparation.create!(ingredient_id: sel.id, recipe_id: recipe2.id, quantity: 1)
# Preparation.create!(ingredient_id: poivre.id, recipe_id: recipe2.id, quantity: 1)
# Preparation.create!(ingredient_id: farine.id, recipe_id: recipe2.id, quantity: 12.5)
# Preparation.create!(ingredient_id: beurre_doux.id, recipe_id: recipe2.id, quantity: 15.5)
# Preparation.create!(ingredient_id: lait.id, recipe_id: recipe2.id, quantity: 125)

# Preparation.create!(ingredient_id: asperge.id, recipe_id: recipe3.id, quantity: 0.25)
# Preparation.create!(ingredient_id: riz.id, recipe_id: recipe3.id, quantity: 75)
# Preparation.create!(ingredient_id: beurre_salé.id, recipe_id: recipe3.id, quantity: 12.5)
# Preparation.create!(ingredient_id: oignon.id, recipe_id: recipe3.id, quantity: 40)
# Preparation.create!(ingredient_id: vin_blanc.id, recipe_id: recipe3.id, quantity: 4)
# Preparation.create!(ingredient_id: bouillon_legume.id, recipe_id: recipe3.id, quantity: 250)
# Preparation.create!(ingredient_id: parmesan.id, recipe_id: recipe3.id, quantity: 25)
# Preparation.create!(ingredient_id: sel.id, recipe_id: recipe3.id, quantity: 1)
# Preparation.create!(ingredient_id: poivre.id, recipe_id: recipe3.id, quantity: 1)