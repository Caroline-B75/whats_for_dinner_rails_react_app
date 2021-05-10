class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :destroy]

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def index
    @recipes = policy_scope(Recipe).order(id: :desc)
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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :price, :time, :content, :diet, :photo)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end