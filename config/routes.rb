Rails.application.routes.draw do

	#Casein routes
	namespace :casein do
		resources :tags
		resources :tracks
		resources :mixes
		resources :broadcasts
    resources :landing
	end

    resources :broadcasts
  
end
