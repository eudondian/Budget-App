class Group < ApplicationRecord
    belongs_to :author, class_name: 'User' 
    has_many :categories
    has_many :expenses, through: :categories
end
