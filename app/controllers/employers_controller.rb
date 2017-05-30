class EmployersController < ApplicationController
	def show
		@employer = Employer.find_by_id(params[:id])
	end
end