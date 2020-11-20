Rails.application.routes.draw do
  root 'boards#index'
  resources :boards

  #會員註冊——————————————————————————registrations controller
  get '/users/sign_up', to: 'registrations#new', as: 'registration'
  post '/users', to: 'registrations#create'

  #會員登入——————————————————————————sessions controller
  get '/users/sign_in', to: 'sessions#new', as: 'session'
  post '/login', to: 'sessions#create', as: 'login'

  #會員登出——————————————————————————sessions controller
  delete '/users/sign_out', to: 'sessions#destroy', as: 'logout'

  #用post動作到/users頁面時，對應到registration的create方法

  # get '/', to: 'boards#index'
  
end
