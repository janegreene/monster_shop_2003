Rails.application.routes.draw do
  root "merchants#index"

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

  get '/admin', to: 'admin/dashboard#index', as: :admin_dashboard
  get '/admin/users/:id', to: 'admin/users#show'
  get '/admin/users', to: 'admin/users#index'

  get '/admin/merchants/:merchant_id/items', to: 'admin/items#index'
  post '/admin/merchants/:merchant_id/items', to: 'admin/items#create', as: :admin_merchant_items
  get '/admin/merchants/:merchant_id/items/new', to: 'admin/items#new'
  patch '/admin/merchants/:merchant_id/items/:id/edit', to: 'admin/items#update'
  get '/admin/merchants/:merchant_id/items/:id/edit', to: 'admin/items#edit', as: :admin_merchant_item
  patch '/admin/merchants/:merchant_id/items/:id', to: 'admin/items#update'
  delete '/admin/merchants/:merchant_id/items/:id', to: 'admin/items#destroy'

  get '/admin/merchants/:id', to: 'admin/merchants#show'
  get '/admin/merchants', to: 'admin/merchants#index'
  get '/admin/merchants/:id', to: 'admin/merchants#update'
  patch '/admin/merchants/:id', to: 'admin/merchants#update'

  get "/register", to: 'users#new'
  get "/register/edit", to: 'users#edit'
  get "/register/password", to: 'users#password'

  patch "/users/password_change", to: "users#password_change"
  resources :users, only:[:create, :update]

  get "/profile", to: 'users#show'
  get "/profile/orders", to: "orders#index"
  get "profile/orders/:id", to:"orders#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :merchants

  resources :items, only:[:index, :show, :edit, :update, :destroy]

  resources :merchants do
    resources :items, only:[:index, :new, :create]
  end

  resources :items do
    resources :reviews, only:[:new, :create]
  end

  resources :reviews, only:[:edit, :update, :destroy]

  post "/cart/:item_id", to: "cart#add_item"
  get "/cart", to: "cart#show"
  delete "/cart", to: "cart#empty"
  delete "/cart/:item_id", to: "cart#remove_item"


  resources :orders, only:[:new, :create, :show]
  patch "/orders/:id/cancel", to: 'orders#cancel'
  patch "/orders/:id/ship", to: 'orders#ship'
end
