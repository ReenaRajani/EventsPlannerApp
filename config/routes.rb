# == Route Map
#
#               Prefix Verb   URI Pattern                                      Controller#Action
#                 root GET    /                                                pages#home
#               signup GET    /signup(.:format)                                users#new
#                login GET    /login(.:format)                                 sessions#new
#                      POST   /login(.:format)                                 sessions#create
# destroy_user_session DELETE /login(.:format)                                 sessions#destroy
#                users GET    /users(.:format)                                 users#index
#                      POST   /users(.:format)                                 users#create
#             new_user GET    /users/new(.:format)                             users#new
#            edit_user GET    /users/:id/edit(.:format)                        users#edit
#                 user GET    /users/:id(.:format)                             users#show
#                      PATCH  /users/:id(.:format)                             users#update
#                      PUT    /users/:id(.:format)                             users#update
#                      DELETE /users/:id(.:format)                             users#destroy
#      event_guest_yes POST   /events/:event_id/guests/:guest_id/yes(.:format) guests#accept
#       event_guest_no POST   /events/:event_id/guests/:guest_id/no(.:format)  guests#decline
#         event_guests GET    /events/:event_id/guests(.:format)               guests#index
#                      POST   /events/:event_id/guests(.:format)               guests#create
#      new_event_guest GET    /events/:event_id/guests/new(.:format)           guests#new
#     edit_event_guest GET    /events/:event_id/guests/:id/edit(.:format)      guests#edit
#          event_guest GET    /events/:event_id/guests/:id(.:format)           guests#show
#                      PATCH  /events/:event_id/guests/:id(.:format)           guests#update
#                      PUT    /events/:event_id/guests/:id(.:format)           guests#update
#                      DELETE /events/:event_id/guests/:id(.:format)           guests#destroy
#               events GET    /events(.:format)                                events#index
#                      POST   /events(.:format)                                events#create
#            new_event GET    /events/new(.:format)                            events#new
#           edit_event GET    /events/:id/edit(.:format)                       events#edit
#                event GET    /events/:id(.:format)                            events#show
#                      PATCH  /events/:id(.:format)                            events#update
#                      PUT    /events/:id(.:format)                            events#update
#                      DELETE /events/:id(.:format)                            events#destroy
#

Rails.application.routes.draw do

  root :to => 'pages#home'
  
  get 'signup' => 'users#new'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'login' => 'sessions#destroy' , :as => 'destroy_user_session'
  resources :users
  # resources :events do
  
  resources :events do
    resources :guests do
        post '/yes' => 'guests#accept'
        post '/maybe' => 'guests#maybe'
        post '/no' => 'guests#decline'
    end
  end
end
