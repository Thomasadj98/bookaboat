Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :boats, only: [ :index, :new, :create ]
end
