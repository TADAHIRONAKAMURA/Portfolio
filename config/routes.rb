Rails.application.routes.draw do
  	devise_for :admins, controllers: {
  		sessions:      'admins/sessions',
  		passwords:     'admins/passwords',
  		registrations: 'admins/registrations'
	}
	devise_for :users, controllers: {
 		sessions:      'users/sessions',
  		passwords:     'users/passwords',
  		registrations: 'users/registrations'
	}
		root 'fishing_spots#index'
	
	resources :users, only: [:show, :edit, :update, :index, :destroy]
	resources :fishing_reports do
		resources :favorites, only: [:create, :destroy]
		resources :report_coment, only: [:create, :destroy]
		resources :complaint, only: [:create, :destroy]
	end
	# delete '/users/:id' => 'users#destroy'
	get 'users/admin_index'
	get 'users/user_show'
	get 'users/complaint_show'
	get 'fishing_reports/admin_index'
	# resources :fishing_spots
	resources :fishing_spots, except: :show
	resources :tackle_reports, except: :show
	# resources :relationships, only: [:show, :edit, :update, :index, :destroy]


	get '/tmp/:dareno/:dotti' => 'relationships#tmp', as: 'tmp'
	get '/follow/:id' => 'relationships#follow', as: 'follow'
	get '/count' => 'relationships#count', as: 'count'
end
