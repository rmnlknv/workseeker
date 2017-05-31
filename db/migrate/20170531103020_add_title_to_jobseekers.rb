class AddTitleToJobseekers < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobseekers, :title, :string, null: false
  	add_column :users, :title, :string
  end
end
