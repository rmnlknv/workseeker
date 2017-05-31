class Vacancy < ApplicationRecord
	belongs_to :employer

	scope :salary, -> (min_salary, max_salary) { where("salary BETWEEN ? AND ?", min_salary, max_salary)}
	#scope :salary, -> (min_salary) { where("salary > ?", min_salary)}
	#scope :salary, -> (salary) { where salary: salary }
  	scope :city, -> (city) { where city: city }
  	scope :category, -> (category) { where("lower(category) like ?", "#{category}%") }
end
