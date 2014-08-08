Rails.application.routes.draw do

	get 'users/:id/profile', to: 'users#show', as: 'profile'

  devise_for :users

  get 'pages/home'
  get 'pages/about'

  root 'questions#index'

  resources :questions


end