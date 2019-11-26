class BillingController < ApplicationController
  before_action :authenticate_user!

  def index
    @user=current_user
    if current_user.stripe_id.nil?
      customer = Stripe::Customer.create({"email": current_user.email})
      #here we are creating a stripe customer with the help of the Stripe library and pass as parameter email.
      current_user.update(:stripe_id => customer.id)
      #we are updating current_user and giving to it stripe_id which is equal to id of customer on Stripe
    end
    @customer = Stripe::Customer.list({email: current_user.email})
    @cards = Stripe::Customer.list_sources(@customer['data'][0]['id'], {object: 'card'},)
  end

  def new_card
    respond_to do |format|
      format.js
    end
  end

  def success_message
  end

  def create_card
    respond_to do |format|
      if current_user.stripe_id.nil?
        customer = Stripe::Customer.create({"email": current_user.email})
        #here we are creating a stripe customer with the help of the Stripe library and pass as parameter email.
        current_user.update(:stripe_id => customer.id)
        #we are updating current_user and giving to it stripe_id which is equal to id of customer on Stripe
      end

      card_token = params[:stripeToken]
      #it's the stripeToken that we added in the hidden input
      if card_token.nil?
        format.html { redirect_to billing_path, error: "Oops"}
      end
      #checking if a card was giving.

      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token
      #we're attaching the card to the stripe customer
      customer.save

      format.html { redirect_to success_path }
    end
  end

  def destroy
    @customer = Stripe::Customer.list({email: current_user.email})
    @card = params[:id]
    Stripe::Customer.delete_source(
      @customer['data'][0]['id'],
      @card,
    )
    redirect_to billing_path
  end

  def success
    redirect_to billing_path
  end
end
