HerokuPinger::Application.routes.draw do
  # resources :websites
  get '/websites' => 'websites#index', :as => 'websites'
  post '/websites' => 'websites#create'
  get '/websites/new' => 'websites#new', :as => 'new_website'
  get '/websites/:id/edit' => 'websites#edit', :as => 'edit_website'
  get '/websites/:id' => 'websites#show', :as => 'website'
  put '/websites/:id' => 'websites#update'
  delete '/websites/:id' => 'websites#destroy'

  root :to => "home#index"
  resources :users, :only => [ :show, :edit, :update ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end
