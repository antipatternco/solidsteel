Rails.application.routes.draw do
  resources :mixes

  get '/latest' => 'mixes#latest'
  
  root 'mixes#latest'
end
