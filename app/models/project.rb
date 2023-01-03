class Project < ApplicationRecord
  belongs_to :department
  belongs_to :fiscal_year
  belongs_to :revenue_source

  validates :title, presence: true, uniqueness: { scope: [:department_id, :fiscal_year_id], message:"Already added" }
end
