class WalletsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def index
    @user = current_user
    @wallets = current_user.wallets
  end

  def new
    @wallet = @user.wallets.new
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @wallet = Wallet.find(params[:id])
  end

  def update
    @wallet = Wallet.find(params[:id])
    if @wallet.update(wallet_param)
      redirect_to user_wallets_path
    else
      render 'edit'
    end
  end


  def destroy
    @wallet = Wallet.find(params[:id])
    @wallet.destroy

    redirect_to user_wallets_path
  end

  def create
    @wallet = Wallet.new(wallet_param)
    @user = params[:user_id]
    @wallet.user_id = @user
    @wallet.cardnumber = params[:wallet][:cardnumber].delete(' ')
    if @wallet.save
      redirect_to user_wallets_path
    else
      render :new
    end
  end

  private
    def wallet_param
      params.require(:wallet).permit(:cardowner, :cardnumber, :expiredate)
    end
    def set_user
      @user = current_user
    end

end
