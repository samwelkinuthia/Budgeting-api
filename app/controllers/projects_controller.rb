class ProjectsController < ApplicationController
  require "csv"
  before_action :set_project, only: %i[ show update destroy ]

  # GET /projects
  def index
    @projects = Project.includes(:fiscal_year).all

    render json: @projects
  end

  # GET /projects/1
  def show
    render json: @project
  end

  # POST /projects
  def create

    quote_chars = %w(" | ~ ^ & *)

    begin
      csv = CSV.read(project_params[:file].tempfile, headers: :first_row, quote_char: quote_chars.shift)
      # @report = CSV.read(csv_file, headers: :first_row, quote_char: quote_chars.shift)
    rescue CSV::MalformedCSVError
      quote_chars.empty? ? raise : retry
    end
    # csv = CSV.parse(file, headers: true, col_sep: ";")

    x = csv.map(&:to_h)

    # binding.pry

    # [24] pry(#<ProjectsController>)> y["samson"] = y.delete(y.keys[0])

    # x[0] = x[0].keys[0].gsub(/[^0-9a-z ]/i, '')
    z = []
    count = Project.all.size
    x.each do |row|
      user_hash = Hash.new
      user_hash[:title] = row['title']
      user_hash[:status] = row['status']
      user_hash[:location] = row['location']
      user_hash[:ward] = row['ward']
      user_hash[:budgetAmount] = row['budgetAmount'].gsub(/[^0-9\.]/, '').to_d
      user_hash[:department_id] = 1
      user_hash[:fiscal_year_id] = 1
      z.push(user_hash)
    end
    # statuses = x.pluck("status").uniq
    # fiscal_years = x.pluck("fiscal_year").uniq
    # locations = x.pluck("location").uniq
    # wards = x.pluck("ward").uniq
    # departments = x.pluck("department").uniq

    # render json: {body:z[0..28]}

    a = Project.insert_all(z)

    count2 = Project.all.size


    render json: {data: nil, success: true, message:count2 > count ? "Successfully added #{count2 - count} records" : "Error Unprocessable Entity"}



    # @project = Project.new(project_params)
    #
    # if @project.save
    #   render json: @project, status: :created, location: @project
    # else
    #   render json: @project.errors, status: :unprocessable_entity
    # end
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
      params.permit(:title, :description, :department_id, :ward, :location, :status, :budgetAmount, :fiscal_year_id, :file)
    end
end
