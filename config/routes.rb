Rails.application.routes.draw do

	#Casein routes
	namespace :casein do
		resources :tags
		resources :tracks
		resources :mixes
		resources :broadcasts
    resources :landing
	end

    get 'broadcasts/latest' => 'broadcasts#latest', :defaults => { :format => :json }
    get 'broadcasts/year/:year' => 'broadcasts#year', :defaults => { :format => :json }
    get 'broadcasts/search/:searchterm' => 'broadcasts#search', :defaults => { :format => :json }
    get 'broadcasts/featured/'  => 'broadcasts#featured', :defaults => { :format => :json }
    get 'broadcasts/highlights/' => 'broadcasts#highlights', :defaults => { :format => :json }
    get 'broadcasts/djs/:alpha' => 'broadcasts#djs', :defaults => { :format => :json }
    get 'broadcasts/:id' => 'broadcasts#show', :defaults => { :format => :json }
  
end
