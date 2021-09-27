class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    @category.save
  end

  def show
    @category = Category.find(params[:id])
    @trips = @category.trips.page(params[:page]).per(6)
  end

  private

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
