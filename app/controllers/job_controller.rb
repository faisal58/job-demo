class JobController < ApplicationController

  include ApplicationHelper
  before_action :authenticate_user!

  def index
    if is_employer?
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
      @saved = @job.save
      @errors = nil
      if !@saved
        #build error messages
        @errors = @job.errors.as_json
      end
      respond_to do |format|
        #format.json
        format.js
      end
    end
  end

  private

  def new_permit_params
    params[:job][:user_id] = current_user.id
    params.require(:job).permit(:user_id, :job_category_id, :title, :location, :description, :salary_range, :application_deadline)
  end

end
