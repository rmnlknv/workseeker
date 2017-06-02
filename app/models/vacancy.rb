class Vacancy < ApplicationRecord
	belongs_to :employer

	validates :title, presence: true, length: { in: 4..26}
	validates :city, presence: true, length: { in: 2..16 }
	validates :description, presence: true, length: { in: 10..600 }
	validates :category, presence: true
	validates :salary, presence: true, numericality: true

	scope :salary, -> (min_salary, max_salary) { where("salary BETWEEN ? AND ?", min_salary, max_salary)}
	#scope :salary, -> (min_salary) { where("salary > ?", min_salary)}
	#scope :salary, -> (salary) { where salary: salary }
  	scope :city, -> (city) { where city: city }
  	scope :category, -> (category) { where("lower(category) like ?", "#{category}%") }
end
