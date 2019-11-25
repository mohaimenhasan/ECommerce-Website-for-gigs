class JobsController < ApplicationController
  before_action :set_user

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = @user.jobs.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(jobs_param)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def delete_job(jobid)
    str_id = Job.find(jobid).stripe_id
    jobv = Stripe::SKU.retrieve(str_id)
    prd_id = jobv["product"]
    Stripe::SKU.delete(jobv["id"])
    Stripe::Product.delete(prd_id)
  end

  def create_job(jobid)
    @job = Job.find(jobid)
    respond_to do |format|
      if @job.stripe_id.nil?
        productv = Stripe::Product.create({
          name: @job.name,
          type: 'good',
          description: @job.description,
          })
        productv.save
        #here we are creating a stripe customer with the help of the Stripe library and pass as parameter email.
        jobv = Stripe::SKU.create({
          currency: 'cad',
          inventory: {
            'type' => 'infinite'
          },
          price: @job.cost.to_i,
          product: productv.id
        })
        @job.update(:stripe_id => jobv.id)
        #we are updating current_user and giving to it stripe_id which is equal to id of customer on Stripe
      end

      jobtoken = params[:stripeToken]
      #it's the stripeToken that we added in the hidden input
      if jobtoken.nil?
        format.html { redirect_to jobs_path, error: "Oops"}
      end
      #checking if a job was giving.
      jobv = Stripe::SKU.new @job.stripe_id
      jobv.save
    end
  end

  def create
    @job = Job.new(jobs_param)
    @user = params[:user_id]
    @subcategory = params[:job][:subcategory_id]
    @job.user_id = @user
    @job.subcategory_id = @subcategory
    if @job.save
      create_job(@job.id)
    else
      render :new
    end
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Job.all.where("lower(jobs.name) LIKE :search ", search: "%#{@parameter}%")
    end
  end


  def destroy
    @job = Job.find(params[:id])
    delete_job(@job.id)
    @job.destroy
    redirect_to users_path
  end

  private
    def jobs_param
      params.require(:job).permit(:name, :cost, :description, :subcategory_id)
    end
    def set_user
      @user = current_user
    end
end
