Rails.application.routes.draw do
  root :to => 'pages#home'
  
  get 'signup' => 'users#new'

  resources :users

  
  # resources :events do
  #   resources :guests do
  #       post '/yes' => 'rsvp#accept'
  #       post '/no' => 'rsvp#decline'
  #   end
  # end
end
