class AddPaymentCardToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :payment_card, :string
  end
end
