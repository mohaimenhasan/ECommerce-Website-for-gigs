class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @jobs = Job.where(:user_id => current_user.id)
    @wallets = Wallet.where(:user_id => current_user.id)
  end
end
