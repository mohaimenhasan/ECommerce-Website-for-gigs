class OrdersController < ApplicationController

  def index
    @user = current_user
    require 'stripe'
    Stripe.api_key = 'sk_test_d2M93QQUhPkg9ckhgQz3IQv900Vn7Lwmh5'
    @order = Stripe::Customer.retrieve({:id.to_s => current_user.id})

  end

end
