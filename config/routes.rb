Rails.application.routes.draw do

  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"
  
  resources :broadcasts do
  	resources :mixes
  end
  
  get '/search' => 'broadcasts#search'

  get '/latest' => 'mixes#latest'
  
  root 'broadcasts#latest'
end
