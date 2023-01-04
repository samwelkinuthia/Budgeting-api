class ReportsController < ApplicationController
  def index

    County.includes(:departments).each do |county|
      
    end
    c = County.find(params[:county_id])
    cbd = {county: c, countyBudgets: c.county_budgets}
    statuses = Project.all.map(&:status).uniq
    n = Hash.new
    statuses.each do |s|
      n[s] = Project.search_status(s).count
    end

    # x = Project.search_department
    y = Department.where(county_id: params[:county_id])
    department_summary = []
    project_counts = []
    y.each do |d|
      z = Hash.new
      a = Hash.new
      z[:department] = d.name
      z[:budgetSummary] = {
        totalBudget: d.totalBudget,
        totalSpent: d.projects.inject(0) {|sum, hash| sum + hash[:spentAmount]}
      }
      a[:department] = d.name
      a[:projects] = Project.search_department(d.id).size
      department_summary.push(z)
      project_counts.push(a)
    end

    render json:{projectCount: project_counts, countySummary: cbd, departmentSummary: department_summary, projectStatus: n}
    # counties = County.includes(:departments).all
    # # c  = counties.map(&:counties)
    # render json: counties
    #
    # res = {
    #   projects_per_department: [
    #     {
    #       department: {},
    #       projects: 100
    #     }
    #   ]
    # }
  end

  def project_stuff
    statuses = Project.all.map(&:status).uniq
    n = Hash.new
    statuses.each do |s|
      n[s] = Project.search_status(s).count
    end

    render json: n
  end

  def department_stuff

  end

  def county_stuff
    counties = County.all
    c  = counties.map(&:counties)
    render json: c
  end
  protected
  def report_params
    params.permit(:county_id)
  end

end
