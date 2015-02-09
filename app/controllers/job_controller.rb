class JobController < ApplicationController

  include ApplicationHelper, JobHelper
  before_action :authenticate_user!

  def index
    if is_employer?
      #all jobs
      @jobs = current_user.jobs
      #all open jobs
      @open_jobs = find_open_jobs(@jobs)
      #create new job
      @job = current_user.jobs.new
      @job_categories = JobCategory.all
    else
      flash[:notice] = " Access forbidden, only employer can access this portions "
      redirect_to :root
    end
  end

  def new
    if is_employer?
      @job = Job.new(new_permit_params)
      if @job.save
        render :json => @job
      else
        render :json => { :errors => @job.errors }, :status => 422
      end
    end
  end

  private

  def new_permit_params
    params.require(:job).permit(:job_category_id, :title, :location, :description, :salary_range, :application_deadline)
  end

end
