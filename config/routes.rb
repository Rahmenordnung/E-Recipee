Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'
  get 'pages/contact', to: 'pages#contact'
  get 'pages/about', to: 'pages#about'
  
  post '/search' => 'recipes#search'
  
  resources :recipes do
    resources :comments, only: [:create]
  end
  
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :ingredients, except: [:destroy]
  
  mount ActionCable.server => '/cable'
  
end
