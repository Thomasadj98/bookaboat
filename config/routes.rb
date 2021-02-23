Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "user/boats", to: "boats#my_boats"
  patch "user", to: "users#become_host"

  resources :boats, only: [ :index, :show, :new, :create ]

end
