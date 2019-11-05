class CreateOngoingTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :ongoing_tasks do |t|
      t.belongs_to :job
      t.belongs_to :user
      t.string :status
      t.float :rating

      t.timestamps
    end
  end
end
