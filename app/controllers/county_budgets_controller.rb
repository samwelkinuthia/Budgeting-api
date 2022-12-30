class CountyBudgetsController < ApplicationController
  before_action :set_county_budget, only: %i[ show update destroy ]
  # before_action :set_county, only: %i[ create ]

  # GET /county_budgets
  def index
    @county_budgets = CountyBudget.all
    json_response(@county_budgets, :ok,  [], true, "#{@county_budgets.count} records found")

  end

  # GET /county_budgets/1
  def show
    json_response(@county_budget, :ok,  [], true, "Successfully fetched details")
    # render json: @county_budget
  end

  # POST /county_budgets
  def create
    # count = CountyBudget.where(fiscal_year_id: county_budget_params[:fiscal_year_id]).where(county_id: county_budget_params[:county_id])

    # binding.pry

    budgets = CountyBudget.where(fiscal_year_id: county_budget_params[:fiscal_year_id], county_id: county_budget_params[:county_id])
    # binding.pry

    if budgets.count < 1
      @county_budget = CountyBudget.new(county_budget_params)
      if @county_budget.save
        json_response(@county_budget, :created, [], true, "County Budget added successfully!")
      else
        json_response(nil, :unprocessable_entity,  @county_budget.errors, false)
      end
    else
      render json: { message: "Budgets already added", success: false, data: nil, errors:[]}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /county_budgets/1
  def update
    if @county_budget.update(county_budget_params)
      render json: @county_budget
    else
      render json: @county_budget.errors, status: :unprocessable_entity
    end
  end

  # DELETE /county_budgets/1
  def destroy
    @county_budget.destroy
  end

  private

   # def set_county
   #   @county_id = County.find(params[:countyId])
   #   @fiscal_year_id = FiscalYear.find(params[:fiscalYearId])
   # end
    # Use callbacks to share common setup or constraints between actions.
    def set_county_budget
      @county_budget = CountyBudget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def county_budget_params
      params.require(:county_budget).permit(:fiscal_year_id, :county_id, :totalBudget, :totalExpenditure, :totalRevenue, :totalPendingBills, :absorptionRate, :totalBalance)
    end
end
