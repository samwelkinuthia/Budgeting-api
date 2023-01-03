class ProjectsController < ApplicationController
  require "csv"
  before_action :set_project, only: %i[ show update destroy ]

  # GET /projects
  def index
    @projects = Project.includes(:fiscal_year).all
    json_response(@projects, :ok,  [], true, "#{@projects.size} records found")

  end

  # GET /projects/1
  def show
    render json: @project
  end


  def import
    quote_chars = %w(" | ~ ^ & *)

    begin
      csv = CSV.read(project_params[:file].tempfile, headers: :first_row, quote_char: quote_chars.shift)
      # @report = CSV.read(csv_file, headers: :first_row, quote_char: quote_chars.shift)
    rescue CSV::MalformedCSVError
      quote_chars.empty? ? raise : retry
    end

    x = csv.map(&:to_h)

    z = []
    count = Project.all.size
    x.each do |row|
      user_hash = Hash.new
      user_hash[:title] = row['title']
      user_hash[:status] = row['status']
      user_hash[:location] = row['location']
      user_hash[:ward] = row['ward']
      user_hash[:budgetAmount] = row['budgetAmount'].gsub(/[^0-9\.]/, '').to_d
      user_hash[:department_id] = params[:department_id]
      user_hash[:fiscal_year_id] = project_params[:fiscal_year_id]
      user_hash[:revenue_source_id] = project_params[:revenue_source_id]
      z.push(user_hash)
    end
    import_csv(z)
  end
  # POST /projects
  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.permit(:title, :description, :department_id, :ward, :location, :status, :budgetAmount, :fiscal_year_id, :file, :revenue_source_id, :county_id)
    end
end
