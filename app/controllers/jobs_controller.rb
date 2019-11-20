class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @user = current_user.fname
    @jobs = Job.where(:user_id => current_user.id)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = @user.jobs.new
  end

  def edit
    @job = Job.find(params[:id])
  
    if @job.update(jobs_param)
      redirect_to users_path
    else
      render :edit
    end
  end

  def create
    @job = Job.new(jobs_param)
    @user = params[:user_id]
    @subcategory = params[:job][:subcategory_id]
    @job.user_id = @user
    @job.subcategory_id = @subcategory
    if @job.save
      redirect_to users_path
    else
      render :new
    end
  end

  private
    def jobs_param
      params.require(:job).permit(:name, :cost, :description, :subcategory_id)
    end
    def set_user
      @user = current_user
    end
end
