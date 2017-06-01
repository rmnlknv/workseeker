Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
	root to: "pages#home"

	resources :vacancies
	#get '/vacancies', to: 'vacancies#list'
	#get '/add_vacancy', to: 'vacancies#new'
	#post '/vacancies', to: 'vacancies#create'
	#get '/vacancies/:id', to: 'vacancies#show', as: 'vacancy'
	get '/my_vacancies', to: 'vacancies#list'


	get '/employers/:id', to: 'employers#show', as: 'employer'
	get '/employers', to: 'employers#index'

	get '/candidates', to: 'jobseekers#index'
	get '/candidate/:id', to: 'jobseekers#show', as: 'jobseeker'

	resources :conversations do
  		resources :messages
 	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
