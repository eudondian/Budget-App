class Expense < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :categories
    has_many :groups, through: :categories
end
