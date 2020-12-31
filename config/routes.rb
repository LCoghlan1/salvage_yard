Rails.application.routes.draw do
  
 
  resources :categories
  
  root 'static_pages#home'
  
  resources :users, except: [:new]
  resources :reviews
  resources :items
  resources :contacts, only: [:new, :create]
  
  post 'message', to: 'messages#create'
  
  post '/search' => 'items#search'
  
  get 'about', to: 'static_pages#about'
  
  get 'chat', to: 'chat#index'
  
  get 'help', to: 'contacts#new'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get '/category/:title' => 'static_pages#category'

  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clear'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/reduce/:id' => 'cart#reduce'
  get '/cart/increase/:id' => 'cart#increase'
  
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  
  get '/checkout' => 'cart#createOrder'
  
  get '/aboutSend/:id' => 'static_pages#aboutSend'

  
  resources :users do
    resources :orders
  end
  
  resources :orders do 
    resources :orderitems
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
