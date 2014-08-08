Rails.application.routes.draw do

	get 'users/:id/show', to: 'users#show', as: 'show'

  devise_for :users

  get 'pages/home'
  get 'pages/about'

  root 'questions#index'

  resources :questions do
  	member do
      put 'like', to: 'questions#upvote'
      put 'dislike', to: 'questions#downvote'

  	end
  end


end