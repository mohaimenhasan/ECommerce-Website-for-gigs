class AddCardownerToWallet < ActiveRecord::Migration[6.0]
  def change
    add_column :wallets, :cardowner, :string
  end
end
