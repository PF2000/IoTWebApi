Rails.application.routes.draw do

scope module: 'api' do
		namespace :v1 do

		  	post 'login' => 'api#login'
		  	post 'logout' => 'api#logout'
		  	post 'resetpassword' => 'users#resetPassword'
		  	match 'resetApiToken/:id' => 'users#resetApiToken', via: [:get]
			match 'isUserPassword/:id' => 'users#isUserPassword', via: [:post]

			resources :users

	  		resources :roles
			resources :schools 
			resources :courses
			resources :degrees
			resources :rooms
			resources :disciplines
		    resources :projects
			resources :school_classes
  			resources :attaches
  			resources :summaries
  			resources :school_years

			resources :schools do
				resources :courses
			end

		 	resources :schools do
				resources :rooms
			end

			resources :courses do
				resources :disciplines
				resources :degrees
			end

			resources :disciplines do
				resources :projects
			end

			resources :disciplines do
				resources :school_classes
			end

			resources :projects do
				resources :summaries
			end
		
		  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
		end
	end
end

