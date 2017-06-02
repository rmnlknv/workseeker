class AddAvatarUrlToEmployers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :image_url, :string
  	add_column :employers, :image_url, :string
  end
end
