class CreatePersonalMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_messages do |t|
      t.text :body
      t.belongs_to :conversation, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
