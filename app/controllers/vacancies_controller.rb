class VacanciesController < ApplicationController
  def index
    @vacancies = current_user.vacancies.order('vacancies.created_at DESC')
  end

  def list
    @vacancies = Vacancy.all.order('vacancies.created_at DESC')
  end

  def new
    @vacancy = Vacancy.new
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

  def show
    @vacancy = Vacancy.find_by_id(params[:id])
  end
end


  private

    def vacancy_params
      params.require(:vacancy).permit(:title, :city, :description, :category)
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