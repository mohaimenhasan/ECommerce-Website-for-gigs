class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :user
      t.string :name
      t.belongs_to :subcategory
      t.float :cost
      t.text :description
      t.timestamps
    end
  end
end
