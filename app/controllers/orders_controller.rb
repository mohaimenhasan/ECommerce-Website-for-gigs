class OrdersController < ApplicationController

  def index
    @user = current_user
    @orders = Order.where(customer_id: current_user.id)

  end

end
