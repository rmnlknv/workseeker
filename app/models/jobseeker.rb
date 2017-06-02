class Jobseeker < User

	validates :name, presence: true, length: { in: 2..26}
	validates :city, presence: true, length: { in: 2..16 }
	validates :position, presence: true, length: { in: 4..16 }
	validates :category, presence: true
	validates :salary, presence: true, numericality: true
	validates :english, presence: true
	validates :seniority, presence: true, numericality: true

	scope :salary, -> (min_salary, max_salary) { where("salary BETWEEN ? AND ?", min_salary, max_salary) }
  	scope :city, -> (city) { where city: city }
  	scope :category, -> (category) { where("lower(category) like ?", "#{category}%") }
  	scope :english, -> (english) { where english: english }
   	scope :seniority, -> (min_seniority, max_seniority) { where("seniority BETWEEN ? AND ?", min_seniority, max_seniority) }
end
