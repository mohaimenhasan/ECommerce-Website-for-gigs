class AddStripeProductIdToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :stripe_id, :string
  end
end
