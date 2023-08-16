require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(full_name: "John Doe", email: "john@example.com", password: "password123") }

  it "is valid with valid attributes" do
    category = Category.new(
      name: "Groceries",
      icon: "grocery_icon",
      author: user
    )
    expect(category).to be_valid
  end

  it "is not valid without a name" do
    category = Category.new(
      icon: "grocery_icon",
      author: user
    )
    expect(category).not_to be_valid
  end

  it "is not valid without an icon" do
    category = Category.new(
      name: "Groceries",
      author: user
    )
    expect(category).not_to be_valid
  end

  it "calculates the total amount of expenditures correctly" do
    category = Category.create(
      name: "Groceries",
      icon: "grocery_icon",
      author: user
    )
    Expense.create(
      name: "Milk",
      amount: 2.5,
      category: category,
      author: user
    )
    Expense.create(
      name: "Bread",
      amount: 1.75,
      category: category,
      author: user
    )

    expect(category.total_amount).to eq(4.25)
  end
end
