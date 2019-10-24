class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user.fname
  end
end
