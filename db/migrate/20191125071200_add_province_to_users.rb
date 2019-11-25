class AddProvinceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :province, :string
  end
end
