class OrdersController < ApplicationController

  def index
    @user = current_user
    @orders = Order.where(customer_id: current_user.id)

  end

  def destroy
    @order = Order.find(params[:id])
    delete_user_order_path(current_user, @order.id)
    @order.destroy
    redirect_to user_orders_path(current_user)
  end

end
