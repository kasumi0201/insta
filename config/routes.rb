Rails.application.routes.draw do
  resources :photos do
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"
    end
  end

  devise_for :users
  # get 'photos/index', to:'photos#index'
  # get 'photos/edit', to:'photos#edit'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
