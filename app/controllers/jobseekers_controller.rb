class JobseekersController < ApplicationController
	def index
		@min_salary_value = Jobseeker.minimum(:salary)
    	@max_salary_value = Jobseeker.maximum(:salary)
    	@min_seniority_value = Jobseeker.minimum(:seniority)
    	@max_seniority_value = Jobseeker.maximum(:seniority)

		@candidates = Jobseeker.where(nil).paginate(page: params[:page], per_page: 5).order('users.created_at DESC')
		@candidates = @candidates.salary(params[:min_salary], params[:max_salary]) if params[:min_salary].present? && params[:max_salary].present?
    	@candidates = @candidates.city(params[:city]) if params[:city].present?
    	@candidates = @candidates.category(params[:category].downcase) if params[:category].present?
    	@candidates = @candidates.english(params[:english]) if params[:english].present?
    	@candidates = @candidates.seniority(params[:min_seniority], params[:max_seniority]) if params[:min_seniority].present? && params[:max_seniority].present?
	end

	def show
		@candidate = Jobseeker.find_by_id(params[:id])

	end

end