class AddCardnumberToWallet < ActiveRecord::Migration[6.0]
  def change
    add_column :wallets, :cardnumber, :string
  end
end
