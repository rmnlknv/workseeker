class Jobseeker < User
	scope :salary, -> (min_salary, max_salary) { where("salary BETWEEN ? AND ?", min_salary, max_salary) }
  	scope :city, -> (city) { where city: city }
  	scope :category, -> (category) { where("lower(category) like ?", "#{category}%") }
  	scope :english, -> (english) { where english: english }
   	scope :seniority, -> (min_seniority, max_seniority) { where("seniority BETWEEN ? AND ?", min_seniority, max_seniority) }
end
