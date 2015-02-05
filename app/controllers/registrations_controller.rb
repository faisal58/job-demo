class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params[:user][:role] = make_seeker_if_not_employer params[:user][:role]
    params.require(:user).permit(:role, :email, :password, :password_confirmation)
  end

  def make_seeker_if_not_employer(role)
    role == :employer ? :employer : :seeker
  end

end
