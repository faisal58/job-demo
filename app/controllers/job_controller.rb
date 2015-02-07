class JobController < ApplicationController

  include ApplicationHelper
  before_action :authenticate_user!

  def index
    if is_employer?
      #all jobs
      @all_jobs_by_employers = Job.find_by_user_id(current_user.id)
      #all open jobs
      @all_open_jobs = find_open_jobs(@all_jobs_by_employers)
      #create new job
      @job = Job.new
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
    params[:job][:user_id] = current_user.id
    params.require(:job).permit(:user_id, :job_category_id, :title, :location, :description, :salary_range, :application_deadline)
  end

end
