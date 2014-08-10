Rails.application.routes.draw do

	get 'users/:id/show', to: 'users#show', as: 'show'
  resources :comments

  devise_for :users

  get 'pages/home'
  get 'pages/about'

  root 'questions#index'


  #resources :answers
  # resources :answers do
  #   member do
  #     put 'like', to: 'questions#answers#upvote'
  #     put 'dislike', to: 'questions#answers#downvote'
  #   end
  # end


  resources :questions do
  	member do
      put 'like', to: 'questions#upvote'
      put 'dislike', to: 'questions#downvote'
  	end
    resources :answers do
      resources :comments
    end
  end
end