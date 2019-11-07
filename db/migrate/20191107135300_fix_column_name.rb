class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :jobs, :subcategory, :subcategory_id
  end
end
