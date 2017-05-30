Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
	root to: "pages#home"
	get '/vacancies', to: 'vacancies#list'
	get '/vacancy_list', to: 'vacancies#index'
	get '/add_vacancy', to: 'vacancies#new'
	post '/vacancies', to: 'vacancies#create'
	get '/vacancies/:id', to: 'vacancies#show', as: 'vacancy'
	get '/employers/:id', to: 'employers#show', as: 'employer'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
