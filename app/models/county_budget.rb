class CountyBudget < ApplicationRecord
  has_one :fiscal_year
  belongs_to :county

  validates :fiscal_year_id, presence: true

  validate :check_fiscal_year_county_id

  def check_fiscal_year_county_id
    # binding.pry
    count = CountyBudget.where(fiscal_year_id: fiscal_year_id).where(county_id: county_id)

    # count.nil?
    # puts fiscal_year_id === county_id
  end
end
