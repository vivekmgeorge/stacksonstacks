Rails.application.routes.draw do

	get 'users/:id/show', to: 'users#show', as: 'show'

  devise_for :users

  get 'pages/home'
  get 'pages/about'

  root 'questions#index'

  resources :questions


end