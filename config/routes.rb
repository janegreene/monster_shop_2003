Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "merchants#index"

  # namespace :merchant do
  #   # get '/', to: 'dashboard#index'
  #   # resources :items
  #   # get '/orders/:id', to: 'orders#show'
  #   # patch '/item_orders/:id', to: 'item_orders#update'
  # end
  get '/merchant', to: 'merchant/dashboard#index', as: :merchant_dashboard
  get '/merchant/orders/:id', to: 'merchant/orders#show'
  patch '/merchant/item_orders/:id', to: 'merchant/item_orders#update'
  get '/merchant/items', to: 'merchant/items#index'
  get '/merchant/items/new', to: 'merchant/items#new'
  post '/merchant/items', to: 'merchant/items#create'
  get '/merchant/items/:id/edit', to: 'merchant/items#edit', as: :edit_merchant_item
  patch '/merchant/items/:id', to: 'merchant/items#update', as: :merchant_item
  put '/merchant/items/:id', to: 'merchant/items#update'
  delete '/merchant/items/:id', to: 'merchant/items#destroy'


  namespace :admin do
    # get '/', to: 'dashboard#index'
    # resources :users, only: [:index, :show]
    resources :merchants, only: [:index, :show, :update] do
      resources :items
    end
  end
  get '/admin', to: 'admin/dashboard#index', as: :admin_dashboard
  get '/admin/users/:id', to: 'admin/users#show'
  get '/admin/users', to: 'admin/users#index'

  # get '/admin/merchants/:merchant_id/items', to: 'admin/items#index'
  # post '/admin/merchants/:merchant_id/items', to: 'admin/items#create'
  # get '/admin/merchants/:merchant_id/items/new', to: 'admin/items#new'
  # get '/admin/merchants/:merchant_id/items/:id/edit', to: 'admin/items#edit'
  # get '/admin/merchants/:merchant_id/items/:id', to: 'admin/items#show'
  # get '/admin/merchants/:merchant_id/items/:id', to: 'admin/items#update'
  # get '/admin/merchants/:merchant_id/items/:id', to: 'admin/items#destroy'

  # get '/admin/merchants/:id/items', to: 'admin/items#index'
  # get '/admin/merchants/:id', to: 'admin/merchants#show'
  # get '/admin/merchants', to: 'admin/merchants#index'
  # get '/admin/merchants/:id', to: 'admin/merchants#update'
  # patch '/admin/merchants/:id', to: 'admin/merchants#update'

  get "/register", to: 'users#new'
  get "/register/edit", to: 'users#edit'
  get "/register/password", to: 'users#password'

  post "/users", to: 'users#create'
  patch "/users", to: 'users#update'
  patch "/users/password_change", to: "users#password_change"

  get "/profile", to: 'users#show'
  get "/profile/orders", to: "orders#index"
  get "profile/orders/:id", to:"orders#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :merchants
  # get "/merchants", to: "merchants#index"
  # get "/merchants/new", to: "merchants#new"
  # get "/merchants/:id", to: "merchants#show"
  # post "/merchants", to: "merchants#create"
  # get "/merchants/:id/edit", to: "merchants#edit"
  # patch "/merchants/:id", to: "merchants#update"
  # delete "/merchants/:id", to: "merchants#destroy"

  get "/items", to: "items#index"
  get "/items/:id", to: "items#show"
  get "/items/:id/edit", to: "items#edit"
  patch "/items/:id", to: "items#update"
  get "/merchants/:merchant_id/items", to: "items#index"
  get "/merchants/:merchant_id/items/new", to: "items#new"
  post "/merchants/:merchant_id/items", to: "items#create"
  delete "/items/:id", to: "items#destroy"

  get "/items/:item_id/reviews/new", to: "reviews#new"
  post "/items/:item_id/reviews", to: "reviews#create"

  get "/reviews/:id/edit", to: "reviews#edit"
  patch "/reviews/:id", to: "reviews#update"
  delete "/reviews/:id", to: "reviews#destroy"

  post "/cart/:item_id", to: "cart#add_item"
  get "/cart", to: "cart#show"
  delete "/cart", to: "cart#empty"
  delete "/cart/:item_id", to: "cart#remove_item"

  get "/orders/new", to: "orders#new"
  post "/orders", to: "orders#create"
  get "/orders/:id", to: "orders#show"
  patch "/orders/:id/cancel", to: 'orders#cancel'
  patch "/orders/:id/ship", to: 'orders#ship'
end
