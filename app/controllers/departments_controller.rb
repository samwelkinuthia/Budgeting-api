class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[ show update destroy ]

  # GET /departments
  def index
    @departments = Department.where(county_id: params[:county_id])
    json_response(@departments, :ok,  [], true, "#{@departments.length} records found")
  end

  # GET /departments/1
  def show
    render json: @department
  end

  # POST /departments
  def create
    @department = Department.new(department_params)

    if @department.save
      json_response(@department, :created, [], true, "Department added successfully!")
    else
      json_response(nil, :unprocessable_entity,  @department.errors, false)
    end
  end

  # PATCH/PUT /departments/1
  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # DELETE /departments/1
  def destroy
    @department.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def department_params
      params.permit(:county_id, :name, :totalBudget, :developmentBudget, :recurrentBudget, :pendingBills)
    end
end
