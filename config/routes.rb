Rails.application.routes.draw do

	#Casein routes
	namespace :casein do
		resources :tags
		resources :tracks
		resources :mixes
		resources :broadcasts
    resources :landing
	end

  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"
  
end
