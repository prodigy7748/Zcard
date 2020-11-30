Rails.application.routes.draw do
  root 'boards#index'

  resource :users, controller: 'registrations', only: [:create, :edit, :update] do
    get '/sign_up', action: 'new' #註冊頁面
  end

  resource :users, controller: 'sessions', only: [] do
    get '/sign_in', action: 'new' #登入頁面
    post '/sign_in', action: 'create' #登入動作
    delete '/sign_out', action: 'destroy'
  end

  resources :boards do
    resources :posts, shallow: true
  end
end

# # /profiles/123
# resources :accounts do
#   resources :profiles, shallow: true
  # resources :profiles, only: [:index, :new, :create]
  # /accounts/2/profiles  列表
  # /accounts/2/profiles/new  新增
  # /accounts/2/profiles/create  新增
# end
# resources :profiles, only: [:show, :edit, :update, :destroy]
# resources :profiles, only: [] do
  # /profiles/3/say_hello
  # member do
  #   get :say_hello
    # /profiles/3/say_hello
  # end

  # collection do
    # get :say_hello
    #/profiles/say_hello
#   end
# end
# /profiles/123  show
# /profiles/123/edit

# /admin/v1/users
# namespace :admin do
#   namespace :v1 do
#     resouruces :users
#   end
# end
#對應到admin/vi/users的controller
