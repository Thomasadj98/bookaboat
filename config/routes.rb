Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boats, only: [ :index, :show, :new, :create ]

  patch "user", to: "users#become_host"
end
