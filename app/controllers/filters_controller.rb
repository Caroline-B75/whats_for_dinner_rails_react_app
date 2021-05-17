class FiltersController < ApplicationController
  before_action :set_filter, only: [:edit, :update, :destroy]

  def index
    @filters = policy_scope(Filter)
    @filter = Filter.new
  end

  def new
    @filter = Filter.new
    authorize @filter
  end

  def create
    @filter = Filter.new(filter_params)
    @filter.save!
    authorize @filter
    redirect_to filters_path
  end

  def edit
    authorize @filter
  end

  def update
    @filter.update(filter_params)
    authorize @filter
    redirect_to filters_path
  end

  def destroy
    @filter.destroy!
    authorize @filter
    redirect_to filters_path
  end

  private

  def filter_params
    params.require(:filter).permit(:name)
  end

  def set_filter
    @filter = Filter.find(params[:id])
  end
  
end