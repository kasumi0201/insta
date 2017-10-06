Rails.application.routes.draw do
  resources :photos do
  member do
    put "like", to: "photos#upvote"
    put "dislike", to: "photos#downvote"
  end
end
  get 'home/index'
  get 'photos/index' ,to: 'photos#index'

    # root to: 'home#index'
  devise_for :users
  # get 'photos'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
