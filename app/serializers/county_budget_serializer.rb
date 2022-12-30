class CountyBudgetSerializer < ActiveModel::Serializer
  has_one :fiscal_year
  has_one :county
  attributes :fiscal_year, :county, :id, :totalBudget, :totalExpenditure, :totalRevenue, :totalPendingBills, :absorptionRate, :totalBalance
end
