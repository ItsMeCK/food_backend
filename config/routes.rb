Rails.application.routes.draw do
  
  resources :food_menus
  resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :parents do 
  	collection do
  		put :verified
  	end
  end
  devise_for :parents, path: 'parents', controllers: { sessions: "parents/sessions" }
	devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }

	resources :parents, :collection => { :complete => :put }
	# devise_for :businessmen, controllers: {
 #           :sessions => "businessmen/sessions",
 #           :registrations => "businessmen/registrations" }
 #  devise_for :reviewers, controllers: {
 #           :sessions => "reviewers/sessions",
 #           :registrations => "reviewers/registrations" }
 #  devise_for :admins

 #  authenticated :businessman do
 #  	root to: "businessmen#show"
	# end 
  
 #  root 'home#home_page'
 #  resources :reviewers

 #  resources :businessmen do
 #    resources :products
 #  end
 #  get '/quick_help' => 'businessmen#quick_help'
end
