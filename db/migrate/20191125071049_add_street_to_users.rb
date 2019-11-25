class AddStreetToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :street, :string
  end
end
