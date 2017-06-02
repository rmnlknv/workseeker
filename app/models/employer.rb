class Employer < User
	has_many :vacancies

	validates :name, presence: true, length: { in: 2..26}
	validates :city, presence: true, length: { in: 2..16 }
	validates :position, presence: true, length: { in: 2..16 }
	validates :company, presence: true, length: { in: 2..16 }
	validates :contact_email, presence: true, email: true
end
