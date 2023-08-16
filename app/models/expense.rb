class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category # Add this line to establish the association

  has_many :category_expenses
  has_many :categories, through: :category_expenses

  validates :name, presence: true
  validates :amount, presence: true

end
