class RevenueSource < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
