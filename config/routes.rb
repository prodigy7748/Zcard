Rails.application.routes.draw do
  root 'boards#index'
  resources :boards

  # get '/', to: 'boards#index'
  
end
