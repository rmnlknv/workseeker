class Employer < User
	has_many :vacancies

	validates :name, presence: true, length: { in: 2..26}, on: :update
	validates :city, presence: true, length: { in: 2..16 }, on: :update
	validates :position, presence: true, length: { in: 2..16 }, on: :update
	validates :company, presence: true, length: { in: 2..16 }, on: :update
	validates :contact_email, presence: true, email: true, on: :update
end
