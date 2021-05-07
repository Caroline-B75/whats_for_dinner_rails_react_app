class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
    authorize @recipe
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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :price, :time, :content, :diet, :photo)
  end
end
