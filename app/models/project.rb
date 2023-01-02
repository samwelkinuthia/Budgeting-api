class Project < ApplicationRecord
  belongs_to :department
  belongs_to :fiscal_year

  validates :title, presence: true, uniqueness: { scope: :department_id }
end
