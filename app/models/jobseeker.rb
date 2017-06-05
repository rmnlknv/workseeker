class Jobseeker < User

	validates :name, presence: true, length: { in: 2..26}, on: :update
	validates :city, presence: true, length: { in: 2..16 }, on: :update
	validates :position, presence: true, length: { in: 4..16 }, on: :update
	validates :category, presence: true, on: :update
	validates :salary, presence: true, numericality: true, on: :update
	validates :english, presence: true, on: :update
	validates :seniority, presence: true, numericality: true, on: :update

	scope :salary, -> (min_salary, max_salary) { where("salary BETWEEN ? AND ?", min_salary, max_salary) }
  	scope :city, -> (city) { where city: city }
  	scope :category, -> (category) { where("lower(category) like ?", "#{category}%") }
  	scope :english, -> (english) { where english: english }
   	scope :seniority, -> (min_seniority, max_seniority) { where("seniority BETWEEN ? AND ?", min_seniority, max_seniority) }
end
