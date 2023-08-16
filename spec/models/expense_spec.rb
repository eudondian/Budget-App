require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(full_name: "John Doe", email: "john@example.com", password: "password123") }
  let(:category) { Category.create(name: "Groceries", icon: "grocery_icon", author: user) }

  it "is valid with valid attributes" do
    expense = Expense.new(
      name: "Milk",
      amount: 2.5,
      category: category,
      author: user
    )
    expect(expense).to be_valid
  end

  it "is not valid without a name" do
    expense = Expense.new(
      amount: 2.5,
      category: category,
      author: user
    )
    expect(expense).not_to be_valid
  end

  it "is not valid without an amount" do
    expense = Expense.new(
      name: "Milk",
      category: category,
      author: user
    )
    expect(expense).not_to be_valid
  end

  it "is not valid without a category" do
    expense = Expense.new(
      name: "Milk",
      amount: 2.5,
      author: user
    )
    expect(expense).not_to be_valid
  end
end
