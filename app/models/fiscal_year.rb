class FiscalYear < ApplicationRecord
  has_many :county_budgets
  validates :name, uniqueness: {message: 'The name is already taken'}, presence: {message: 'The name must not be blank'}
  validates :date_from, presence: true
  validates :date_to, presence: true
end
