Rails.application.routes.draw do
  resources :broadcasts

  resources :mixes

  get '/latest' => 'mixes#latest'
  
  root 'broadcasts#latest'
end
