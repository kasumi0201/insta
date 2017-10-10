Rails.application.routes.draw do
    root 'home#index'
    resources :relationships, only: [:create, :destroy]
  resources :photos do
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


  devise_for :users, :skip => [:sessions]
as :user do
  get 'sign-in' => 'devise/sessions#new', :as => :new_user_session
  post 'sign-in' => 'devise/sessions#create', :as => :user_session
  delete 'sign-out' => 'devise/sessions#destroy', :as => :destroy_user_session
end

  get 'photos/index', to:'photos#index'
  get 'photos/edit', to:'photos#edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
