class IngredientsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update, :destroy]

  def index
    @ingredients = policy_scope(Ingredient).order(name: :asc)
    @ingredient = Ingredient.new
  end

  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save!
    authorize @ingredient
    redirect_to ingredients_path
  end

  def edit
    authorize @ingredient
  end

  def update
    @ingredient.update(ingredient_params)
    authorize @ingredient
    redirect_to ingredients_path
  end

  def destroy
    @ingredient.destroy!
    authorize @ingredient
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit, :category)
  end

  def set_restaurant
    @ingredient = Ingredient.find(params[:id])
  end
end