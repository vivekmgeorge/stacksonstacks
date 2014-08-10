Rails.application.routes.draw do

  get 'users/:id/show', to: 'users#show', as: 'show'
  resources :comments

  devise_for :users, :controllers => { registrations: 'registrations' }


  get 'pages/home'
  get 'pages/about'

  root 'questions#index'

  resources :questions do
    member do
      put 'like', to: 'questions#upvote'
      put 'dislike', to: 'questions#downvote'
    end
    resources :answers do
      member do
        put 'like', to: 'answers#upvote'
        put 'dislike', to: 'answers#downvote'
      end
    end

    resources :answers
    resources :comments
  end
end