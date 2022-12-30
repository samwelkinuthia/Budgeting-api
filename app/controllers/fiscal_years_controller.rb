class FiscalYearsController < ApplicationController
  before_action :set_fiscal_year, only: %i[ show update destroy ]

  # GET /fiscal_years
  def index
    @fiscal_years = FiscalYear.all

    render json: @fiscal_years
  end

  # GET /fiscal_years/1
  def show
    render json: @fiscal_year
  end

  # POST /fiscal_years
  def create
    @fiscal_year = FiscalYear.new(fiscal_year_params)

    if @fiscal_year.save
      render json: @fiscal_year, status: :created, location: @fiscal_year
    else
      render json: @fiscal_year.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fiscal_years/1
  def update
    if @fiscal_year.update(fiscal_year_params)
      render json: @fiscal_year
    else
      render json: @fiscal_year.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fiscal_years/1
  def destroy
    @fiscal_year.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiscal_year
      @fiscal_year = FiscalYear.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fiscal_year_params
      params.require(:fiscal_year).permit(:date_from, :date_to, :name)
    end
end
