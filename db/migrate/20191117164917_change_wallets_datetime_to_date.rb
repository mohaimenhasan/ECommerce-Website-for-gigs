class ChangeWalletsDatetimeToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :wallets, :expiredate, :date
  end
end
