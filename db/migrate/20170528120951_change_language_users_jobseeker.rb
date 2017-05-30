class ChangeLanguageUsersJobseeker < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :english
  	add_column :users, :english, :string
  	remove_column :jobseekers, :english
  	add_column :jobseekers, :english, :string, null: false
  end
end
