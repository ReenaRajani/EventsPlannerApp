# == Route Map
#
#               Prefix Verb   URI Pattern               Controller#Action
#         sessions_new GET    /sessions/new(.:format)   sessions#new
#                 root GET    /                         pages#home
#               signup GET    /signup(.:format)         users#new
#                login GET    /login(.:format)          sessions#new
#                      POST   /login(.:format)          sessions#create
# destroy_user_session DELETE /login(.:format)          sessions#destroy
#                users GET    /users(.:format)          users#index
#                      POST   /users(.:format)          users#create
#             new_user GET    /users/new(.:format)      users#new
#            edit_user GET    /users/:id/edit(.:format) users#edit
#                 user GET    /users/:id(.:format)      users#show
#                      PATCH  /users/:id(.:format)      users#update
#                      PUT    /users/:id(.:format)      users#update
#                      DELETE /users/:id(.:format)      users#destroy
#

Rails.application.routes.draw do
  get 'sessions/new'

  root :to => 'pages#home'
  
  get 'signup' => 'users#new'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'login' => 'sessions#destroy' , :as => 'destroy_user_session'
  resources :users

  
  # resources :events do
  #   resources :guests do
  #       post '/yes' => 'rsvp#accept'
  #       post '/no' => 'rsvp#decline'
  #   end
  # end
end
