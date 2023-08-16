class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :expenses, foreign_key: :author_id
  has_many :categories, foreign_key: :author_id

  attr_accessor :full_name

  validates :full_name, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true, length: { minimum: 6 }
end
