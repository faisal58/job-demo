class ProfileController < ApplicationController

  include ApplicationHelper
  before_action :authenticate_user!

  def my_profile
    if is_seeker?
      @profile = current_user.seeker
      if @profile.nil?
        redirect_to :create_profile
      end
    end
  end

  def create
    if current_user.seeker.nil?
      @profile = Seeker.new
      @url = store_profile_path
    else
      @profile = current_user.seeker
      @url = update_profile_path
    end
    render 'profile/profile'
  end

  def store
    @profile = Seeker.new(permit_seeker_params)
    @profile.user = current_user
    if @profile.save
      render :json => @profile
    else
      render :json => { :errors => @profile.errors }, :status => 422
    end
  end

  def edit

  end


  def update
    @profile = Seeker.find_by_user_id(current_user.id)
    if @profile.update_attributes(permit_seeker_params)
      render :json => @profile
    else
      render :json => { :errors => @profile.errors }, :status => 422
    end
  end

  def view_profile

  end

  private

  def permit_seeker_params
    params.require(:seeker).permit(:first_name, :last_name, :dob, :objective, :career_overview, :expected_salary)
  end

end
