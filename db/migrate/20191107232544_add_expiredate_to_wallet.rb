class AddExpiredateToWallet < ActiveRecord::Migration[6.0]
  def change
    add_column :wallets, :expiredate, :datetime
  end
end
