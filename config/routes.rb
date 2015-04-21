Rails.application.routes.draw do

	#Casein routes
	namespace :casein do
		resources :tags
		resources :tracks
		resources :mixes
		resources :broadcasts
    resources :landing
	end
	
	get '/api/broadcasts/:id' => 'broadcasts#show'
	get '/api/year/:year' => 'broadcasts#year'
	get '/api/search/:contains' => 'broadcasts#search'
	get '/api/featured' => 'broadcasts#featured'
	get '/api/latest' => 'broadcasts#latest'
	get '/api/djs/:name' => 'broadcasts#djs'

end
