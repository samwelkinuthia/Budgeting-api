class RevenueSource < ApplicationRecord
  validates :name, uniqueness: true
end
