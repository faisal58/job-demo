class JobFrontController < ApplicationController

  include JobFrontHelper

  def index
    @jobs = job_by_categories
  end

  def show
    @jobs = JobCategory.find_by_id(params[:id]).jobs
    @category_name = JobCategory.find_by_id(params[:id]).name
  end

  def job_view
    @job = Job.find_by_id(params[:id])
  end

end
