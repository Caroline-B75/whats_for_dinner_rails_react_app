  
class PreparationsController < ApplicationController
  before_action :set_preparation, only: [:destroy]

  def create
    @preparation = Preparation.new(preparation_params)
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(@preparation.ingredient_id)
    @preparation.recipe = @recipe
    @preparation.ingredient = @ingredient
    @preparation.save!
    authorize @preparation
    authorize @recipe
    redirect_to edit_recipe_path(@recipe)
  end

  def destroy
    @preparation.destroy!
    @recipe = Recipe.find(params[:id])
    authorize @preparation
    redirect_to edit_recipe_path(@recipe)
  end

  private

  def preparation_params
    params.require(:preparation).permit(:quantity, :ingredient_id)
  end

  def set_preparation
    @preparation = Preparation.find(params[:recipe_id])
  end
  
end