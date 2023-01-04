class Project < ApplicationRecord
  belongs_to :department
  belongs_to :fiscal_year
  belongs_to :revenue_source
  has_one :county, through: :department
  scope :search_status, ->(status) { where(status: status) }
  scope :search_department, ->(dept) { where(department_id: dept) }
  # delegate :county, :to => :department, :allow_nil => true
  # validates :title, presence: true, uniqueness: { scope: [:fiscal_year_id], message:"Already added" }
  def self.do_shit
    x ||= Project.where(department_id: 1)
    x.each do |item|
      item.update(spentAmount: item.budgetAmount * 0.125, description: "Update number : something")
    end

  end

end
