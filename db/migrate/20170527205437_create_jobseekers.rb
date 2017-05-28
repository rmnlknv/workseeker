class CreateJobseekers < ActiveRecord::Migration[5.0]
  def change
    create_table :jobseekers do |t|
      t.string :name, null: false
      t.string :position, null: false
      t.integer :salary, null: false
      t.string :city, null: false
      t.text :experience
      t.integer :seniority, null: false
      t.integer :category_id, null: false
      t.integer :english, null: false
      t.text :expectations
      t.text :achievements
      t.timestamps
    end
  end
end
