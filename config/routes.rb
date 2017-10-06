Rails.application.routes.draw do
  resources :photos do
  member do
    put "like", to: "photos#upvote"
    put "dislike", to: "photos#downvote"
  end
end

  #  get 'photos/index' ,to: 'photos#index'


  devise_for :users
   get 'photos/index', to:'photos#index'
   get 'photos/edit', to:'photos#edit'
  #  get 'photos/(photo)', to:'photos#show'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
