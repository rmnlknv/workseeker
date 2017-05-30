class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :title, null: false
      t.string :city, null: false
      t.string :description, null: false
      t.string :category, null: false
      t.integer :employer_id
      t.timestamps
    end
  end
end
