Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  get 'photos/index', to:'photos#index'
  get 'photos/edit', to:'photos#edit'

  resources :relationships, only: [:create, :destroy]
  resources :photos do
  resources :comments
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"
    end
  end
  resources :users do
    member do
      get :following, :followers
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
