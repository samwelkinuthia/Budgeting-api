class CountyBudgetSerializer < ActiveModel::Serializer
  attributes :id, :totalBudget, :totalExpenditure, :totalRevenue, :totalPendingBills, :absorptionRate, :totalBalance
  has_one :fiscal_year
  has_one :county
end
