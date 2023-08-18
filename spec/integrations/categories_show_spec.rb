require 'rails_helper'

RSpec.describe 'Viewing a category', type: :feature do
  before(:each) do
    @user = User.create!(full_name: 'Paul Set', email: 'seup@example.com', password: 'password')
    @category = Category.create!(name: 'Food', icon: 'img-avatar.png', author: @user)
    @expense1 = @category.expenses.create!(name: 'Groceries', amount: 50, author_id: @user.id)
    @expense2 = @category.expenses.create!(name: 'Restaurants', amount: 100, author_id: @user.id)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password'
    click_button 'next'
  end

  it 'displays the category name' do
    expect(page).to have_content('Food')
  end

  it 'displays the category icon' do
    # visit category_path(@category)
    assert_selector "img[src*='img-avatar.png']", visible: :all
  end
  # it "displays the category icon" do
  #   visit category_path(@category)
  #   save_and_open_screenshot # This will save a screenshot in your working directory
  #   expect(page).to have_css("img[alt='Category Icon']")
  # end



  it 'displays the total amount' do
    visit category_path(@category)
    expect(page).to have_content(/Total Amount:\s*150/)
  end




  it 'has a link back to categories' do
    visit category_path(@category)
    expect(page).to have_link('←', href: categories_path)
  end
end
