Rails.application.routes.draw do

	#Casein routes
	namespace :casein do
		resources :tracks
		resources :mixes
		resources :broadcasts
    resources :landing
	end


  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"
  
  resources :broadcasts do
  	resources :mixes
  end
  
  get '/search' => 'broadcasts#search'

  get '/latest' => 'mixes#latest'
  
  root 'broadcasts#latest'
end
