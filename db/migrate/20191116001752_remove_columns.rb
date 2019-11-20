class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :payment_card
  end
end
