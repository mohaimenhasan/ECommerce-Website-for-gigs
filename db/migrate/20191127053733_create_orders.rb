class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :job_id
      t.integer :user_id
      t.integer :status, default: 0
      t.integer :customer_id
      t.float :amount
      t.string :stripe_id

      t.timestamps
    end
  end
end
