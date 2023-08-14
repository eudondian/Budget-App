class Category < ApplicationRecord
  belongs_to :groups
  belongs_to :expenses
end
