class AddSalaryToVacancy < ActiveRecord::Migration[5.0]
  def change
  	add_column :vacancies, :salary, :integer
  end
end
