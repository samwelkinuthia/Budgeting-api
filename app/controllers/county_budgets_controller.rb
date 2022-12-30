class CountyBudgetsController < ApplicationController
  before_action :set_county_budget, only: %i[ show update destroy ]

  # GET /county_budgets
  def index
    @county_budgets = CountyBudget.all

    render json: @county_budgets
  end

  # GET /county_budgets/1
  def show
    render json: @county_budget
  end

  # POST /county_budgets
  def create
    @county_budget = CountyBudget.new(county_budget_params)

    if @county_budget.save
      render json: @county_budget, status: :created, location: @county_budget
    else
      render json: @county_budget.errors, status: :unprocessable_entity
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
    # Use callbacks to share common setup or constraints between actions.
    def set_county_budget
      @county_budget = CountyBudget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def county_budget_params
      params.require(:county_budget).permit(:fiscal_year_id, :county_id, :totalBudget, :totalExpenditure, :totalRevenue, :totalPendingBills, :absorptionRate, :totalBalance)
    end
end
