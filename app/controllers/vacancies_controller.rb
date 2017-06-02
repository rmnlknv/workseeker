class VacanciesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :redirect_to_vacancies, :if => :not_employer?, only: [:new, :edit, :create, :update, :list]

  def index
    #min and max salaries for filter
    @min_salary_value = Vacancy.minimum(:salary)
    @max_salary_value = Vacancy.maximum(:salary)

    #filter params
    @min_salary_from_form = params[:min_salary] if params[:min_salary].present?
    @max_salary_from_form = params[:max_salary] if params[:max_salary].present?
    @city_from_form = params[:city] if params[:city].present?
    @category_from_form = params[:category] if params[:category].present?


    @vacancies = Vacancy.where(nil).paginate(page: params[:page], per_page: 5).order('vacancies.created_at DESC') # creates an anonymous scope
    @vacancies = @vacancies.salary(params[:min_salary], params[:max_salary]) if params[:min_salary].present? && params[:max_salary].present?
    @vacancies = @vacancies.city(params[:city]) if params[:city].present?
    @vacancies = @vacancies.category(params[:category].downcase) if params[:category].present?
  end

  def list
    @vacancies = current_user.vacancies.order('vacancies.created_at DESC')
  end


  def new
    @vacancy = Vacancy.new
    @categories = Category.all
  end

  def edit
    @vacancy = Vacancy.find_by_id(params[:id])
    @categories = Category.all
  end

  def create
    @vacancy = current_user.vacancies.new(vacancy_params)
    if @vacancy.save
      flash[:notice] = "Vacancy created successfully."
      redirect_to(:action => 'index')
    else
      @categories = Category.all
      render('new')
    end
  end

  def update
    @vacancy = Vacancy.find_by_id(params[:id])

    if @vacancy.update(vacancy_params)
      flash[:notice] = 'Vacancy was successfully updated.'
      redirect_to @vacancy
    else
      flash[:alert] = 'Error has been occured while updating vacancy.'
      render :edit
    end
  end

  def show
    @vacancy = Vacancy.find_by_id(params[:id])
  end

  def destroy
    @vacancy = Vacancy.find_by_id(params[:id])
    if @vacancy.destroy
      flash[:notice] = 'Vacancy was successfully destroyed.' 
      redirect_to my_vacancies_url
    else
      flash[:alert] = 'Some error has been occured.'
      redirect_to my_vacancies_url
    end

  end



  private
  
  def redirect_to_vacancies
    flash[:alert] = "Only for employers."
    redirect_to vacancies_path
  end

  def not_employer?
    if user_signed_in?
      return current_user.type != "Employer"
    end
  end


  def vacancy_params
    params.require(:vacancy).permit(:title, :city, :description, :category, :salary)
  end

end
