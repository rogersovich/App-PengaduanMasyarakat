Rails.application.routes.draw do

  
  resources :categories
  get 'pages/index'
  get 'dashboard/index'

  namespace :admin do
    resources :responses, :except => [:show, :destroy]
      get '/responses/:id', to: 'responses#destroy', as: 'responses_destroy'
    resources :complaints, :except => [:show, :destroy]
      get '/complaints/:id', to: 'complaints#destroy', as: 'complaints_destroy'
    resources :societies, :except => [:show, :destroy]
      get '/societies/:id', to: 'societies#destroy', as: 'societies_destroy'
    resources :users, :except => [:show, :destroy]
      get '/users/:id', to: 'users#destroy', as: 'users_destroy'
    resources :roles, except: [:show, :destroy]
      get '/roles/:id', to: 'roles#destroy', as: 'roles_destroy'
    resources :categories, except: [:show, :destroy]
      get '/categories/:id', to: 'categories#destroy', as: 'categories_destroy'

    #custom
    get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  end

  #custom
  get '/homes', to: 'homes#index', as: 'home'
  get '/signUp', to: 'homes#register', as: 'signUp'
  post '/signUp', to: 'homes#register', as: 'signUp_proses'
  get '/signIn', to: 'homes#login', as: 'signIn'
  post '/signIn', to: 'homes#login', as: 'signIn_proses'
  get '/logout', to: 'homes#destroy', as: 'logout'
  get '/file_upload', to: 'homes#upload', as: 'file_upload'
  post '/proses', to: 'homes#proses', as: 'proses'


end
