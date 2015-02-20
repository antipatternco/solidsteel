Rails.application.routes.draw do
  resources :broadcasts do
  	resources :mixes
  end
  
  get '/latest' => 'mixes#latest'
  
  root 'broadcasts#latest'
end
