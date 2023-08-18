require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(full_name: 'John Doe', email: 'john@example.com', password: 'password123') }

  it 'is valid with valid attributes' do
    category = Category.new(
      name: 'Groceries',
      icon: 'grocery_icon',
      author: user
    )
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(
      icon: 'grocery_icon',
      author: user
    )
    expect(category).not_to be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(
      name: 'Groceries',
      author_id: user.id
    )
    expect(category).not_to be_valid
  end
  
end
