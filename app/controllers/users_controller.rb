class UsersController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fname, :lname, :email, :password)}
       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fname, :lname, :email, :password, :current_password)}
  end
  def index
    @user = current_user.fname
    @jobs = Job.where(:user_id => current_user.id)
    @wallets = Wallet.where(:user_id => current_user.id)
  end

end
