class ExpensesController < ApplicationController
  before_action :set_category, only: %i[new create]

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses
    @total_amount = @expenses.sum(:amount)
  end

  def new
    @category = current_user.categories.find(params[:category_id])
    @expense = Expense.new
    @categories = current_user.categories
  end

  def create
    @expense = current_user.expenses.new(expense_params)
    @expense.category_id = @category.id

    if @expense.save
      redirect_to category_path(@category), notice: 'Expense created successfully!'
    else
      render :new
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
