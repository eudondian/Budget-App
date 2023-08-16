require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(
      full_name: "John Doe",
      email: "john@example.com",
      password: "password123"
    )
    expect(user).to be_valid
  end

  it "is not valid without a full name" do
    user = User.new(
      email: "john@example.com",
      password: "password123"
    )
    expect(user).not_to be_valid
  end

  it "is not valid with a short full name" do
    user = User.new(
      full_name: "John",
      email: "john@example.com",
      password: "password123"
    )
    expect(user).not_to be_valid
  end

  it "is not valid without an email" do
    user = User.new(
      full_name: "John Doe",
      password: "password123"
    )
    expect(user).not_to be_valid
  end

  it "is not valid with a duplicate email" do
    User.create(
      full_name: "John Doe",
      email: "john@example.com",
      password: "password123"
    )
    user = User.new(
      full_name: "Jane Doe",
      email: "john@example.com",
      password: "password456"
    )
    expect(user).not_to be_valid
  end

  it "is not valid without a password" do
    user = User.new(
      full_name: "John Doe",
      email: "john@example.com"
    )
    expect(user).not_to be_valid
  end
end
