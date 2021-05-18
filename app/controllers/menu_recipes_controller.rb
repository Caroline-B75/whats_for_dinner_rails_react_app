class MenuRecipesController < ApplicationController
  def show
    @menu_recipe = MenuRecipe.find(params[:id])
    authorize @menu_recipe
    
    @menu_recipe.recipe.preparations.each do |preparation|
      preparation.quantity = preparation.quantity * @menu_recipe.number_of_people
    end
    
    @review = Review.new
    @reviews = @menu_recipe.recipe.reviews
    if !@reviews.nil?
      @average_review = @reviews.average(:rating)
    end

    @user_favorite = current_user.favorites.include? Recipe.find(@menu_recipe.recipe_id)
    @user_review = @menu_recipe.recipe.reviews.find_by(user_id: current_user.id)
  end

  def create
    @menu = Menu.find(params[:menu_id])
    if params[:recipe_id] == "random"
      recipe = create_list_recipes_not_existing(@menu).sample
    else
      recipe = Recipe.find(params[:recipe_id])
    end

    @menu_recipe = MenuRecipe.new(menu: @menu, recipe: recipe, number_of_people: @menu.number_of_people)
    @menu_recipe.save!
    authorize @menu_recipe

    redirect_to edit_menu_path(@menu)
  end

  def update
    @menu_recipe = MenuRecipe.find(params[:id])
    @menu = @menu_recipe.menu
    @menu_recipe.update(menu_recipe_params)

    authorize @menu_recipe
    redirect_to edit_menu_path(@menu) if params[:recipe] == "new"
  end

  def switch
    @menu = Menu.find(params[:menu_id])
    list_recipes = create_list_recipes_not_existing(@menu)
    new_menu_recipe = list_recipes.sample
    @menu_recipe = MenuRecipe.find(params[:id])
    @menu_recipe.update(recipe: new_menu_recipe)

    authorize @menu_recipe
    redirect_to edit_menu_path(@menu)
  end

  def self.create_menu_recipes(menu)
    @menu = menu
    diet = @menu.diet
    if diet == "flexitarien"
      flexitarian_recipes = Recipe.all.sample(@menu.number_of_meals)
      flexitarian_recipes.each do |recipe|
        MenuRecipe.create!(menu_id: @menu.id, recipe_id: recipe.id, number_of_people: @menu.number_of_people, done: false)
      end
    else
      correct_diet_recipes = Recipe.where(diet: diet).sample(@menu.number_of_meals)
      correct_diet_recipes.each do |recipe|
        MenuRecipe.create!(menu_id: @menu.id, recipe_id: recipe.id, number_of_people: @menu.number_of_people, done: false)
      end
    end
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @menu_recipe = MenuRecipe.find(params[:id])
    @menu_recipe.destroy

    authorize @menu_recipe
    redirect_to edit_menu_path(@menu)
  end

  private

  def menu_recipe_params
    params.require(:menu_recipe).permit(:number_of_people, :done, :favorite)
  end

  def create_list_recipes(diet)
    if diet == "flexitarien"
      list_recipes = Recipe.all
    else
      list_recipes = Recipe.where(diet: diet)
    end
    return list_recipes
  end

  def create_list_recipes_not_existing(menu)
    menu_recipes_ids = []
    menu.menu_recipes.each do |menu_recipe|
      menu_recipes_ids << Recipe.find(menu_recipe.recipe_id)
    end
    if menu.diet == "flexitarien"
      list_recipes = Recipe.where.not(id: menu_recipes_ids)
    else
      list_recipes = Recipe.where.not(id: menu_recipes_ids).where(diet: menu.diet)
    end
    return list_recipes
  end
end