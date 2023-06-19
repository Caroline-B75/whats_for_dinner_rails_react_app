class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :destroy]

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def index
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result(distinct: true) # Utiliser distinct: true pour éviter les doublons
    @recipes = policy_scope(@recipes.includes(:ingredients, :favorite_recipes, :favorited_by)).order(id: :desc)
    
    if params[:favorited_by_current_user] == "true"
      @recipes = @recipes.joins(:favorite_recipes).where(favorite_recipes: { user_id: current_user.id })
    end
  
    @recipe = Recipe.new
  end
  

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save!
    authorize @recipe
    redirect_to edit_recipe_path(@recipe)
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.new
    @preparation = Preparation.new
    authorize @recipe
  end

  def update
    @recipe.update(recipe_params)
    authorize @recipe
    redirect_to recipes_path
  end

  def destroy
    @recipe.destroy!
    authorize @recipe
    redirect_to recipes_path
  end

  def favorite
    if !Recipe.find(params[:id]).nil?
      recipe = Recipe.find(params[:id])
      current_user.favorites << recipe
      flash[:notice] = "#{recipe.name} a été ajouté à vos recettes favorites"
      redirect_to request.referrer
      authorize recipe
    else
      @menu_recipe = MenuRecipe.find(params[:id])
      recipe = Recipe.find(@menu_recipe.recipe_id)
      current_user.favorites << recipe
      flash[:notice] = "#{recipe.name} a été ajouté à vos recettes favorites"
      redirect_to request.referrer
      authorize recipe
    end
  end

  def unfavorite
    if !Recipe.find(params[:id]).nil?
      recipe = Recipe.find(params[:id])
      current_user.favorites.delete(recipe)
      flash[:notice] = "#{recipe.name} a été retiré de vos recettes favorites"
      redirect_to request.referrer
      authorize recipe
    else
      @menu_recipe = MenuRecipe.find(params[:id])
      recipe = Recipe.find(@menu_recipe.recipe_id)
      current_user.favorites.delete(recipe)
      flash[:notice] = "#{recipe.name} a été retiré de vos recettes favorites"
      redirect_to request.referrer
      authorize recipe
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :price, :time, :content, :diet, :photo, filter_ids:[])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end