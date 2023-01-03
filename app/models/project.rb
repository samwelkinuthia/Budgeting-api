class Project < ApplicationRecord
  belongs_to :department
  belongs_to :fiscal_year
  belongs_to :revenue_source
  scope :search_status, ->(status) { where(status: status) }
  scope :search_department, ->(dept) { where(department_id: dept) }
  delegate :county, :to => :department, :allow_nil => true
  # validates :title, presence: true, uniqueness: { scope: [:fiscal_year_id], message:"Already added" }
end
