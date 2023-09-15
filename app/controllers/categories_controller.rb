class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:transactions).where(author: current_user)
  end

  def new
    @category = Category.new
  end

  def create
    current_user.categories.create(category_params)
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
