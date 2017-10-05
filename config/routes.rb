Rails.application.routes.draw do
  resources :photos, only: [:new, :create, :index, :edit, :update]
  get 'home/index'

get 'photos/index' ,to: 'photos#index'

    # root to: 'home#index'
  devise_for :users



  root 'photos#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
