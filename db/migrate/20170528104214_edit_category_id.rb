class EditCategoryId < ActiveRecord::Migration[5.0]
  def change
  	remove_column :jobseekers, :category_id
  	remove_column :users, :category_id
  	add_column :jobseekers, :category, :string, null: false
  	add_column :users, :category
  end
end
