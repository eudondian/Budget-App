class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = current_user.categories
  end

  def show
    @expenses = @category.expenses.order(created_at: :desc)
    @total_amount = @expenses.sum(:amount)
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      flash[:notice] = "#{@category.name} created successfully"
      redirect_to categories_path
    else
      flash[:alert] = 'Fill all required fields'
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def set_category
    @category = current_user.categories.find(params[:id])
  end
end
