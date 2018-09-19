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
		resources :report_comments, only: [:create, :destroy]
		resources :complaints, only: [:create, :destroy]
	end
	# delete '/users/:id' => 'users#destroy'
	get '/mypage' => 'users#mypage'
	get '/contract' => 'users#contract'
	get '/user_index' => 'users#user_index'
	# get '/report_index' => 'fishing_reports#report_index'
	
	# get 'fishing_reports/admin_index'
	# get 'users/admin_index'

	resources :fishing_spots
	# resources :fishing_spots, except: :show
	resources :tackle_reports, except: :show
	# resources :relationships, only: [:show, :edit, :update, :index, :destroy]

	# get 'users/:id' => 'relationships#show', as: 'user'
	get '/tmp/:whose/:which' => 'relationships#tmp', as: 'tmp'
	get '/follow/:id' => 'relationships#follow', as: 'follow'
	get '/count' => 'relationships#count', as: 'count'
end
