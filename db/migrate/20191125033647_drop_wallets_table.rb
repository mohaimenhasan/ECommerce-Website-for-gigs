class DropWalletsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :wallets
  end
end
