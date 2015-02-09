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
    @already_applied = JobApplication.where(job_id: params[:id], user_id: current_user.id)
  end

  def apply_for_job
    # job_id = params[:id]
    application = JobApplication.new
    application.user = current_user
    application.job = Job.find_by_id(params[:id])
    application.save
    redirect_to :back
  end

end
