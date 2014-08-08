Rails.application.routes.draw do
  devise_for :users

  get 'pages/home'
  get 'pages/about'

  root 'questions#index'

  resources :questions

  get 'users/:id/show', to: 'users#show'

end