class PagesController < ApplicationController
	def home
		if user_signed_in?
			if current_user.type == "Employer"
				redirect_to candidates_path
			end
			if current_user.type == "Jobseeker"
				redirect_to vacancies_path
			end
		end
	end
end
