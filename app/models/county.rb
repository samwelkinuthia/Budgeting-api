class County < ApplicationRecord
  has_many :county_budgets
  has_many :departments
  has_many :projects, through: :departments
  has_many :users
  validates :name, presence: {message: 'The name must be present'}
  validates :code, presence:{message: 'The code must be present'}, uniqueness: {message: 'County with code %(value) already exists!'}
end
