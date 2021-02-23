Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  patch "user", to: "users#become_host"
  resources :boats, only: [ :index, :new, :create ]

end
