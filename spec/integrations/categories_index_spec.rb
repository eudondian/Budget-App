require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :view do
  before(:each) do
    @user = User.create!(
      full_name: 'Paul Set',
      email: 'seu1@example.com',
      password: 'password'
    )

    @category1 = Category.create!(
      name: 'Food',
      icon: 'https://example.com/food.jpg',
      author_id: @user.id
    )

    @category2 = Category.create!(
      name: 'Bills',
      icon: 'https://example.com/bills.jpg',
      author_id: @user.id
    )

    assign(:categories, [@category1, @category2])
    render
  end

  it 'displays the category name' do
    expect(rendered).to match(/Food/)
    expect(rendered).to match(/Bills/)
  end
end
