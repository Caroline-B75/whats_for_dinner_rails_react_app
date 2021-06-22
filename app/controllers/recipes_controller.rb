class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :destroy]

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def index
    @search = Recipe.search(params[:q])
    @recipes = policy_scope(@search.result.includes(:ingredients, :favorite_recipes, :favorited_by)).order(id: :desc)
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
    @menu_recipe = MenuRecipe.find(params[:id])
    recipe = Recipe.find(@menu_recipe.recipe_id)
    current_user.favorites << recipe
    flash[:notice] = "#{recipe.name} a été ajouté à vos recettes favorites"
    redirect_to request.referrer
    authorize recipe
  end

  def unfavorite
    @menu_recipe = MenuRecipe.find(params[:id])
    recipe = Recipe.find(@menu_recipe.recipe_id)
    current_user.favorites.delete(recipe)
    flash[:notice] = "#{recipe.name} a été retiré de vos recettes favorites"
    redirect_to request.referrer
    authorize recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :price, :time, :content, :diet, :photo, filter_ids:[])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end