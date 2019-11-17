class UsersController < ApplicationController
  def index
    @user = current_user.fname
    @jobs = Job.where(:user_id => current_user.id)
    @wallets = Wallet.where(:user_id => current_user.id)
  end

end
