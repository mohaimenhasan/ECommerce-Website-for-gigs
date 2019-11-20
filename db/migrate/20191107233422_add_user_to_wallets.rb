class AddUserToWallets < ActiveRecord::Migration[6.0]
  def change
    add_reference :wallets, :user, null: false, foreign_key: true
  end
end
