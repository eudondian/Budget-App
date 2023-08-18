class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :expenses
  def total_amount
    expense.sum(:amount)
  end

  validates :name, presence: true
  validates :icon, presence: true
end
