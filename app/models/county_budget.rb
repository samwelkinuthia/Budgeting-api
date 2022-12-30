class CountyBudget < ApplicationRecord
  belongs_to :fiscal_year
  belongs_to :county
end
