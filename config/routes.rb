Rails.application.routes.draw do
  get 'signup' => 'users#new'

  root :to => 'pages#home'
  resources :events do
    resources :guests do
        post '/yes' => 'rsvp#accept'
        post '/no' => 'rsvp#decline'
    end
  end
end
