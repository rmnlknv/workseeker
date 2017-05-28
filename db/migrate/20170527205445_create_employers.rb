class CreateEmployers < ActiveRecord::Migration[5.0]
  def change
    create_table :employers do |t|
      t.string :name, null: false
      t.string :position, null: false
      t.string :company, null: false
      t.string :contact_email
      t.string :phone
      t.timestamps
    end
  end
end
