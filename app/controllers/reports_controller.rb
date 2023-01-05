class ReportsController < ApplicationController
  include ActiveSupport::NumberHelper
  def index
    x = []
    elapsed = Benchmark.measure do
      County.all.each do |county|
        next unless county.projects.count > 0
        budgetInfo = {
          # county: county.name,
          pending_bills: county.departments.sum(:pendingBills),
          totalBudget: county.departments.sum(:totalBudget),
          totalExpenditure: county.projects.sum(:spentAmount),
          absorptionRate: num_to_p((county.projects.sum(:spentAmount) / county.departments.sum(:totalBudget)) * 100)
        }
        projectInfo = {
          totalProjects: county.projects.size,
          onGoing: county.projects.where(status: 'Ongoing').size,
          new: county.projects.where(status: 'New').size,
          complete: county.projects.where(status: 'Complete').size
        }
        final = {
          countyName: county.name,
          countyBudget: budgetInfo,
          countyProjects: projectInfo
        }
        x.push(final)
      end
    end
    render json: {time: elapsed.real, data: x}


    c = County.find(params[:county_id])
    cbd = { county: c, countyBudgets: c.county_budgets }
    statuses = Project.all.map(&:status).uniq
    n = {}
    statuses.each do |s|
      n[s] = Project.search_status(s).count
    end

    # x = Project.search_department
    y = Department.includes([:projects]).where(county_id: params[:county_id])
    department_summary = []
    project_counts = []
    y.each do |d|
      z = {}
      a = {}
      z[:department] = d.name
      z[:budgetSummary] = {
        totalBudget: d.totalBudget,
        totalSpent: d.projects.inject(0) { |sum, hash| sum + hash[:spentAmount] }
      }
      a[:department] = d.name
      a[:projects] = Project.search_department(d.id).size
      department_summary.push(z)
      project_counts.push(a)
    end

    # render json:{overall_data: x,  individual_county_data: {projectCount: project_counts, countySummary: cbd, departmentSummary: department_summary, projectStatus: n}}
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

  def num_to_p(num)
    number_to_percentage(num, precision: 2)                          # => 100%
  end

  def project_stuff
    statuses = Project.all.map(&:status).uniq
    n = {}
    statuses.each do |s|
      n[s] = Project.search_status(s).count
    end

    render json: n
  end

  def department_stuff; end

  def county_stuff
    counties = County.all
    c = counties.map(&:counties)
    render json: c
  end

  protected

  def report_params
    params.permit(:county_id)
  end
end
