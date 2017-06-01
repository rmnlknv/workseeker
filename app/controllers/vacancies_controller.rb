class VacanciesController < ApplicationController

  def index
    @min_salary_value = Vacancy.minimum(:salary)
    @max_salary_value = Vacancy.maximum(:salary)

    #@vacancies = Vacancy.all
    @vacancies = Vacancy.where(nil).paginate(page: params[:page], per_page: 5).order('vacancies.created_at DESC') # creates an anonymous scope
    @vacancies = @vacancies.salary(params[:min_salary], params[:max_salary]) if params[:min_salary].present? && params[:max_salary].present?
    @vacancies = @vacancies.city(params[:city]) if params[:city].present?
    @vacancies = @vacancies.category(params[:category].downcase) if params[:category].present?
    #@vacancies = Vacancy.all.order('vacancies.created_at DESC')
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

    def vacancy_params
      params.require(:vacancy).permit(:title, :city, :description, :category, :salary)
    end

end

=begin
  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order('position ASC')
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show', :id => @page.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def page_params
      params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
    end

=end