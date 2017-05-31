class JobseekersController < ApplicationController
	def index
		@candidates = Jobseeker.all
	end

end