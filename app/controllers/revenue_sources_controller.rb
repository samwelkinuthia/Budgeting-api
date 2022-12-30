class RevenueSourcesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_revenue_source, only: %i[ show update destroy ]

  # GET /revenue_sources
  def index
    @revenue_sources = RevenueSource.all

    render json: @revenue_sources
  end

  # GET /revenue_sources/1
  def show
    render json: @revenue_source
  end

  # POST /revenue_sources
  def create
    @revenue_source = RevenueSource.new(revenue_source_params)

    if @revenue_source.save
      render json: {success: true, data: @revenue_source, errors:  @revenue_source.errors.full_messages}, status: :created
    else
      render json: {success: false, errors: @revenue_source.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /revenue_sources/1
  def update
    if @revenue_source.update(revenue_source_params)
      render json: @revenue_source
    else
      render json: @revenue_source.errors, status: :unprocessable_entity
    end
  end

  # DELETE /revenue_sources/1
  def destroy
    @revenue_source.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revenue_source
      @revenue_source = RevenueSource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def revenue_source_params
      params.require(:revenue_source).permit(:name)
    end
end
