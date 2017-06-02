class EmployersController < ApplicationController
	before_action :authenticate_user!
	def index
		@employers = Employer.all.paginate(page: params[:page], per_page: 5).order('users.created_at DESC')
	end

	def show
		@employer = Employer.find_by_id(params[:id])
	end
end